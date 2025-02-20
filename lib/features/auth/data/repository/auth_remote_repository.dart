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
      // You can add your login logic or data manipulation here
      return await _authRemoteDatasource.loginUser(username, password);
    } catch (e) {
      throw ServerException('Login failed: ${e.toString()}', statusCode: 400);
    }
  }

  @override
  Future<void> registerUser(UserEntity entity, File profileImage) async {
    try {
      await _authRemoteDatasource.registerUser(entity, profileImage);
    } catch (e) {
      throw ServerException('Registration failed: ${e.toString()}', statusCode: 400);
    }
  }

  @override
  Future<void> uploadProfilePicture(File file) async {
    try {
      return await _authRemoteDatasource.uploadProfilePicture(file);
    } catch (e) {
      throw ServerException('Profile picture upload failed: ${e.toString()}', statusCode: 500);
    }
  }
}
