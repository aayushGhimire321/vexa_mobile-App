
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';

abstract interface class IUserRepository {
  Future<Either<Failure, void>> createUser(UserEntity userEntity);
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<Either<Failure, void>> deleteUser(String userId);
}

