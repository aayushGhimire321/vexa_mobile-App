import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../app/constants/server_exception.dart';
import '../../../domain/entity/auth_entity.dart';
import '../../model/auth_api_model.dart';
import '../local_data_source.dart';

class AuthRemoteDataSource implements IAuthLocalDataSource {
  final String baseUrl;
  final Dio dio;

  AuthRemoteDataSource({required this.baseUrl, required this.dio});

  @override
  Future<void> registerUser(UserEntity userEntity, File profileImage) async {
    final url = Uri.parse('$baseUrl/auth/signup');

    // Prepare form data
    FormData formData = FormData.fromMap({
      'name': userEntity.name,
      'email': userEntity.email,
      'password': userEntity.password,
      'profileImage': profileImage.path.isNotEmpty
          ? await MultipartFile.fromFile(profileImage.path)
          : null, // Ensure profileImage is being passed correctly
    });

    // Log the form data being sent to the server for debugging
    print('Form Data being sent to the server:');
    formData.fields.forEach((field) {
      print('${field.key}: ${field.value}');
    });

    try {
      final response = await dio.post(
        url.toString(),
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data', // Ensure multipart form is set
          },
        ),
      );

      // Log the server response for debugging
      print('Response: ${response.data}');

      if (response.statusCode != 200) {
        throw ServerException('Failed to register user: ${response.data}');
      }
    } catch (e) {
      // Log the error details for debugging
      print('Error: $e');
      throw ServerException('Failed to register user: $e');
    }
  }

  @override
  Future<UserEntity?> loginUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/auth/signin');
    try {
      final response = await dio.post(
        url.toString(),
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final user = AuthApiModel.fromJson(data);
        return user.toEntity();
      } else {
        throw ServerException('Invalid username or password');
      }
    } catch (e) {
      throw ServerException('Failed to log in: $e');
    }
  }

  @override
  Future<void> uploadProfilePicture(File file) async {
    final url = Uri.parse('$baseUrl/uploadProfilePicture');
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path),
      });

      final response = await dio.post(
        url.toString(),
        data: formData,
      );

      if (response.statusCode != 200) {
        throw ServerException('Failed to upload profile picture');
      }
    } catch (e) {
      throw ServerException('Failed to upload profile picture: $e');
    }
  }

  @override
  Future<UserEntity> getCurrentUser() async {
    final url = Uri.parse('$baseUrl/currentUser');
    try {
      final response = await dio.get(url.toString());

      if (response.statusCode == 200) {
        final data = response.data;
        final user = AuthApiModel.fromJson(data);
        return user.toEntity();
      } else {
        throw ServerException('Failed to fetch current user');
      }
    } catch (e) {
      throw ServerException('Failed to fetch current user: $e');
    }
  }

  @override
  Future<List<UserEntity>> getUsersInProject(String projectId) async {
    final url = Uri.parse('$baseUrl/project/$projectId/users');
    try {
      final response = await dio.get(url.toString());

      if (response.statusCode == 200) {
        final data = response.data;
        final users = (data as List)
            .map((userData) => AuthApiModel.fromJson(userData))
            .toList();
        return users.map((user) => user.toEntity()).toList();
      } else {
        throw ServerException('Failed to fetch users in project');
      }
    } catch (e) {
      throw ServerException('Failed to fetch users in project: $e');
    }
  }

  @override
  Future<void> createUser(UserEntity userEntity) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserEntity>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> getUserById(String userId) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserEntity userEntity) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
