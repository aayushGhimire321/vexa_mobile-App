import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../app/constants/api_endpoints.dart';
import '../../../../app/constants/server_exception.dart';
import '../../domain/entity/auth_entity.dart';

import '../data_source/local_data_source.dart';
import '../data_source/remote_datasource/auth_remote_datasource.dart';
import '../model/auth_api_model.dart';

abstract class AuthRemoteRepository implements IAuthLocalDataSource {
  final AuthRemoteDataSource _authRemoteDatasource;

  AuthRemoteRepository(this._authRemoteDatasource);

  @override
  Future<UserEntity> getCurrentUser() async {
    try {
      return await _authRemoteDatasource.getCurrentUser();
    } catch (e) {
      throw ServerException('Failed to fetch current user', statusCode: 500);
    }
  }

  @override
  Future<UserEntity?> loginUser(String username, String password) async {
    try {
      // Ensure email and password are being passed correctly
      print('Login user with email: $username and password: $password');
      return await _authRemoteDatasource.loginUser(username, password);
    } catch (e) {
      print('Login failed: $e');
      throw ServerException('Login failed: ${e.toString()}', statusCode: 400);
    }
  }

  @override
  Future<void> registerUser(UserEntity entity, File profileImage) async {
    try {
      // Log the data being sent to the server
      print('Registering user with email: ${entity.email}');
      print('User data: ${entity.toJson()}');

      await _authRemoteDatasource.registerUser(entity, profileImage);
    } catch (e) {
      print('Registration failed: $e');
      throw ServerException('Registration failed: ${e.toString()}', statusCode: 400);
    }
  }

  @override
  Future<void> uploadProfilePicture(File file) async {
    try {
      print('Uploading profile picture');
      return await _authRemoteDatasource.uploadProfilePicture(file);
    } catch (e) {
      print('Profile picture upload failed: $e');
      throw ServerException('Profile picture upload failed: ${e.toString()}', statusCode: 500);
    }
  }
}
