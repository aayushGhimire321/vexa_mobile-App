import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entity/auth_entity.dart';
import '../data_source/local_datasource/local_datasource.dart';
import 'auth_repository.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository({required AuthLocalDataSource authLocalDataSource})
      : _authLocalDataSource = authLocalDataSource;

  @override
  Future<Either<Failure, void>> createUser(UserEntity user) async {
    try {
      await _authLocalDataSource.createUser(user);
      return Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error creating user: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(String userId) async {
    try {
      await _authLocalDataSource.deleteUser(userId);
      return Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error deleting user: $e'));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    try {
      final users = await _authLocalDataSource.getAllUsers();
      return Right(users);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error getting all users: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getUserById(String userId) async {
    try {
      final user = await _authLocalDataSource.getUserById(userId);
      return Right(user);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error fetching user by ID: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(UserEntity user) async {
    try {
      await _authLocalDataSource.updateUser(user);
      return Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error updating user: $e'));
    }
  }
}
