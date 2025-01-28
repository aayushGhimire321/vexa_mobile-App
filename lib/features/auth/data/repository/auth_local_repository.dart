import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/local_datasource/local_datasource.dart';
import 'auth_remote_repository.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository({required AuthLocalDataSource authLocalDataSource})
      : _authLocalDataSource = authLocalDataSource;

  @override
  Future<Either<Failure, String>> createUser(UserEntity user) async {
    try {
      await _authLocalDataSource.createUser(user);
      return const Right("success"); // Return success as a String
    } catch (e) {
      return Left(LocalDatabaseFailure(
          message: 'Error creating user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteUser(String userId) async {
    try {
      await _authLocalDataSource.deleteUser(userId);
      return const Right("success"); // Return success as a String
    } catch (e) {
      return Left(LocalDatabaseFailure(
          message: 'Error deleting user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    try {
      final users = await _authLocalDataSource.getAllUsers();
      return Right(users); // Return the list of users
    } catch (e) {
      return Left(LocalDatabaseFailure(
          message: 'Error getting all users: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getUserById(String userId) async {
    try {
      final user = await _authLocalDataSource.getUserById(userId);
      return Right(user); // Return the user
    } catch (e) {
      return Left(LocalDatabaseFailure(
          message: 'Error fetching user by ID: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> updateUser(UserEntity user) async {
    try {
      await _authLocalDataSource.updateUser(user);
      return const Right("success"); // Return success as a String
    } catch (e) {
      return Left(LocalDatabaseFailure(
          message: 'Error updating user: ${e.toString()}'));
    }
  }
}
