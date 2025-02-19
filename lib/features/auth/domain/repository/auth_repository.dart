import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:vexa/features/auth/domain/entity/auth_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class IAuthRepository {
  // Register user with the full UserEntity object
  Future<Either<Failure, void>> registerUser(UserEntity user);

  // Login user using email and password, and return a token or message
  Future<Either<Failure, String>> loginUser(
      String email, String password);

  // Upload profile picture (returns success or failure)
  Future<Either<Failure, String>> uploadProfilePicture(File file);

  // Get current authenticated user
  Future<Either<Failure, UserEntity>> getCurrentUser();
}
