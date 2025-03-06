import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vexa/features/auth/domain/entity/auth_entity.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_service.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  @override
  Future<Either<Failure, void>> registerUser(UserEntity user) async {
    try {
      final response = await apiService.dio.post('/register', data: user.toJson());
      if (response.statusCode == 200) {
        return Right(null); // Registration success
      } else {
        return Left(ApiFailure(message: 'Registration failed', statusCode: response.statusCode));
      }
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> loginUser(String username, String password) async {
    try {
      final response = await apiService.dio.post('/login', data: {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        // Assuming the API returns a token
        return Right(response.data['token']);
      } else {
        return Left(ApiFailure(message: 'Login failed', statusCode: response.statusCode));
      }
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path),
      });
      final response = await apiService.dio.post('/upload', data: formData);
      if (response.statusCode == 200) {
        return Right(response.data['url']);
      } else {
        return Left(ApiFailure(message: 'Upload failed', statusCode: response.statusCode));
      }
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final response = await apiService.dio.get('/current_user');
      if (response.statusCode == 200) {
        final userEntity = UserEntity.fromJson(response.data);
        return Right(userEntity);
      } else {
        return Left(ApiFailure(message: 'Failed to get current user', statusCode: response.statusCode));
      }
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
