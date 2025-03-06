import 'dart:io';
import '../../../../core/network/hive_service.dart';

import '../../domain/entity/auth_entity.dart';
import '../data_source/local_data_source.dart';
import '../model/auth_hive_model.dart';

class AuthLocalDataSource implements IAuthLocalDataSource {
  final HiveService _hiveService;
  AuthLocalDataSource(this._hiveService);

  @override
  Future<void> createUser(UserEntity userEntity) async {
    try {
      final userHiveModel = AuthHiveModel.fromEntity(userEntity);
      await _hiveService.addUser(userHiveModel);
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    try {
      await _hiveService.deleteUser(userId);
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

  Future<UserEntity> getCurrentUser() {
    // Return Empty AuthEntity
    return Future.value(const UserEntity(
      userId: "1",
      image: "",
      password: "",
      email: '',
      name: '',
    ));
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    try {
      final usersHiveModels = await _hiveService.getAllUsers();
      return usersHiveModels.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to fetch all users: $e');
    }
  }

  @override
  Future<UserEntity?> getUserById(String userId) async {
    try {
      final userHiveModel = await _hiveService.getUserById(userId);
      return userHiveModel?.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }

  @override
  Future<void> updateUser(UserEntity userEntity) async {
    try {
      final userHiveModel = AuthHiveModel.fromEntity(userEntity);
      await _hiveService.updateUser(userHiveModel);
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  Future<UserEntity?> loginUser(String username, String password) async {
    try {
      final userHiveModel = await _hiveService.getUserById(username);
      if (userHiveModel == null) {
        throw Exception('User not found.');
      }
      if (userHiveModel.password == password) {
        return userHiveModel.toEntity();
      } else {
        throw Exception('Invalid password.');
      }
    } catch (e) {
      throw Exception('Failed to login user: $e');
    }
  }

  Future<void> registerUser(UserEntity userEntity) async {
    try {
      final existingUser = await _hiveService.getUserById(userEntity.name);
      if (existingUser != null) {
        throw Exception('Username already exists.');
      }
      final userHiveModel = AuthHiveModel.fromEntity(userEntity);
      await _hiveService.addUser(userHiveModel);
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  Future<void> forgetPassword(String username, String newPassword) async {
    try {
      final userHiveModel = await _hiveService.getUserById(username);
      if (userHiveModel == null) {
        throw Exception('User not found.');
      }
      userHiveModel.password = newPassword;
      await _hiveService.updateUser(userHiveModel);
    } catch (e) {
      throw Exception('Failed to reset password: $e');
    }
  }

  Future<String> uploadProfilePicture(File file) {
    throw UnimplementedError();
  }

  // Validate login credentials: Checks username and password
  Future<bool> validateLogin(String username, String password) async {
    try {
      final userHiveModel = await _hiveService.getUserById(username);
      if (userHiveModel == null) {
        return false; // User not found
      }
      return userHiveModel.password == password; // Check password match
    } catch (e) {
      throw Exception('Failed to validate login: $e');
    }
  }
}