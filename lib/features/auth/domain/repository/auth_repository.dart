import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, String>> createUser(UserEntity userEntity);
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<Either<Failure, String>> deleteUser(String userId);
  Future<Either<Failure, UserEntity?>> getUserById(String userId);
  Future<Either<Failure, String>> updateUser(UserEntity userEntity);
}
