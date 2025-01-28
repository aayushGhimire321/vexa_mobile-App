import 'package:dartz/dartz.dart'; // Import dartz package
import '../../../../core/error/failure.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';

import '../data_source/remote_datasource/auth_remote_datasource.dart'; // Import the Failure class

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, String>> createUser(UserEntity userEntity) async {
    try {
      await _authRemoteDataSource.createUser(userEntity);
      return const Right("success"); // Return success as a String
    } catch (e) {
      return Left(Failure(message: 'Failed to create user: $e')); // Left indicates failure
    }
  }

  @override
  Future<Either<Failure, String>> deleteUser(String userId) async {
    try {
      await _authRemoteDataSource.deleteUser(userId);
      return const Right("success"); // Return success as a String
    } catch (e) {
      return Left(Failure(message: 'Failed to delete user: $e')); // Left indicates failure
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    try {
      final users = await _authRemoteDataSource.getAllUsers();
      return Right(users); // Right indicates success
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch all users: $e')); // Left indicates failure
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getUserById(String userId) async {
    try {
      final user = await _authRemoteDataSource.getUserById(userId);
      return Right(user); // Right indicates success
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch user: $e')); // Left indicates failure
    }
  }

  @override
  Future<Either<Failure, String>> updateUser(UserEntity userEntity) async {
    try {
      await _authRemoteDataSource.updateUser(userEntity);
      return const Right("success"); // Return success as a String
    } catch (e) {
      return Left(Failure(message: 'Failed to update user: $e')); // Left indicates failure
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> loginUser(String username, String password) async {
    try {
      final user = await _authRemoteDataSource.loginUser(username, password);
      return Right(user); // Right indicates success
    } catch (e) {
      return Left(Failure(message: 'Failed to login user: $e')); // Left indicates failure
    }
  }

  @override
  Future<Either<Failure, String>> registerUser(UserEntity userEntity) async {
    try {
      await _authRemoteDataSource.registerUser(userEntity);
      return const Right("success"); // Return success as a String
    } catch (e) {
      return Left(Failure(message: 'Failed to register user: $e')); // Left indicates failure
    }
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String username, String newPassword) async {
    try {
      await _authRemoteDataSource.forgetPassword(username, newPassword);
      return const Right("success"); // Return success as a String
    } catch (e) {
      return Left(Failure(message: 'Failed to reset password: $e')); // Left indicates failure
    }
  }

  @override
  Future<Either<Failure, String>> generateOtp(String email) async {
    try {
      await _authRemoteDataSource.generateOtp(email);
      return const Right("success"); // Return success as a String
    } catch (e) {
      return Left(Failure(message: 'Failed to generate OTP: $e')); // Left indicates failure
    }
  }

  @override
  Future<Either<Failure, String>> verifyOtp(String email, String otp) async {
    try {
      await _authRemoteDataSource.verifyOtp(email, otp);
      return const Right("success"); // Return success as a String
    } catch (e) {
      return Left(Failure(message: 'Failed to verify OTP: $e')); // Left indicates failure
    }
  }
}
