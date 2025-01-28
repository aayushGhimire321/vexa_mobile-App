import 'package:dio/dio.dart';
import '../../../../../app/constants/api_endpoints.dart';
import '../../../domain/entity/auth_entity.dart';
import '../../model/auth_api_model.dart';
import '../local_data_source.dart';

class AuthRemoteDataSource implements IAuthLocalDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  @override
  Future<void> createUser(UserEntity userEntity) async {
    try {
      final userApiModel = AuthApiModel.fromEntity(userEntity);
      final response = await _dio.post(
        ApiEndpoints.signUp,
        data: userApiModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode != 201) {
        throw Exception('Failed to create user: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to create user: ${e.message}');
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    try {
      final response = await _dio.delete(
        '${ApiEndpoints.findUserByEmail}/$userId',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to delete user: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to delete user: ${e.message}');
    }
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    try {
      final response = await _dio.get(
        ApiEndpoints.findUserByEmail,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        final usersList = (response.data as List)
            .map((user) => AuthApiModel.fromJson(user).toEntity())
            .toList();
        return usersList;
      } else {
        throw Exception('Failed to fetch all users: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch all users: ${e.message}');
    }
  }

  @override
  Future<UserEntity?> getUserById(String userId) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.findUserByEmail}/$userId',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        return AuthApiModel.fromJson(response.data).toEntity();
      } else {
        throw Exception('User not found: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch user: ${e.message}');
    }
  }

  @override
  Future<void> updateUser(UserEntity userEntity) async {
    try {
      final userApiModel = AuthApiModel.fromEntity(userEntity);
      final response = await _dio.put(
        ApiEndpoints.signUp, // You can change this to the correct endpoint if required
        data: userApiModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update user: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to update user: ${e.message}');
    }
  }

  @override
  Future<UserEntity?> loginUser(String username, String password) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.signIn,
        data: {'email': username, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        return AuthApiModel.fromJson(response.data).toEntity();
      } else {
        throw Exception('Invalid login credentials: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to login user: ${e.message}');
    }
  }

  @override
  Future<void> registerUser(UserEntity userEntity) async {
    try {
      final existingUser = await getUserById(userEntity.username);
      if (existingUser != null) {
        throw Exception('Username already exists.');
      }
      final userApiModel = AuthApiModel.fromEntity(userEntity);
      final response = await _dio.post(
        ApiEndpoints.signUp,
        data: userApiModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode != 201) {
        throw Exception('Failed to register user: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to register user: ${e.message}');
    }
  }

  @override
  Future<void> forgetPassword(String username, String newPassword) async {
    try {
      final response = await _dio.put(
        ApiEndpoints.resetPassword,
        data: {'email': username, 'newPassword': newPassword},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to reset password: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to reset password: ${e.message}');
    }
  }

  Future<void> generateOtp(String email) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.generateOtp,
        data: {'email': email},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to generate OTP: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to generate OTP: ${e.message}');
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.verifyOtp,
        data: {'email': email, 'otp': otp},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to verify OTP: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to verify OTP: ${e.message}');
    }
  }
}
