import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:vexa/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/network/api_service.dart';

class AuthRepository implements IAuthRepository {
  static const Duration connectionTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
  static const String baseUrl = "http://10.0.2.2:3000/api/v1/";

  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: connectionTimeout,
    receiveTimeout: receiveTimeout,
    headers: {"Content-Type": "application/json"},
  ));

  @override
  Future<Map<String, dynamic>> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "auth/signup",
        data: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
        }),
      );

      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "auth/signin",
        data: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> googleSignIn(String token) async {
    try {
      final response = await _dio.post(
        "auth/google",
        data: jsonEncode({"token": token}),
      );

      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> findUserByEmail(String email) async {
    try {
      final response = await _dio.get(
        "auth/findbyemail",
        queryParameters: {"email": email},
      );

      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> generateOtp(String email) async {
    try {
      final response = await _dio.post(
        "auth/generateotp",
        data: jsonEncode({"email": email}),
      );

      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dio.post(
        "auth/verifyotp",
        data: jsonEncode({
          "email": email,
          "otp": otp,
        }),
      );

      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      final response = await _dio.post(
        "auth/forgetpassword",
        data: jsonEncode({
          "email": email,
          "newPassword": newPassword,
        }),
      );

      return response.data;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Map<String, dynamic> _handleDioError(DioException e) {
    if (e.response != null) {
      return {"error": e.response?.data["message"] ?? "Something went wrong"};
    } else {
      return {"error": "Network error, please try again"};
    }
  }

  @override
  Future<String> uploadProfilePicture({required String userId, required String filePath}) async {
    // TODO: implement uploadProfilePicture
    try {
      final response = await uploadProfilePicture(userId: userId, filePath: filePath);
      return response.message; // Assuming the response contains a message
    } catch (e) {
      throw Exception("Failed to upload profile picture: $e"); // Handle any errors
    }
  }
}

extension on String {
  String get message => 'Error';
}
