import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> createUser(UserEntity userEntity);
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<Either<Failure, void>> deleteUser(String userId);
  Future<Either<Failure, UserEntity?>> getUserById(String userId);
  Future<Either<Failure, void>> updateUser(UserEntity userEntity);
}
