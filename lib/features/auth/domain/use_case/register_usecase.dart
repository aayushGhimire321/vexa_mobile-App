import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:vexa/features/auth/domain/entity/auth_entity.dart';

import '../../../../core/error/failure.dart';
import '../repository/auth_repository.dart';

class RegisterUserParams {
  final String email;
  final String username;
  final String password;


  RegisterUserParams({
    required this.email,
    required this.username,
    required this.password, File? profileImage,
  });
}

class RegisterUseCase {
  final IAuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failure, void>> call(RegisterUserParams params) async {
    // Check if the input is valid
    if (params.email.isEmpty || params.username.isEmpty || params.password.isEmpty) {
      return const Left(InvalidInputFailure(message: 'invalid input')); // Return the InvalidInputFailure
    }

    // Create the AuthEntity object for the user
    final authEntity = UserEntity(
      email: params.email,
      username: params.username,
      password: params.password, image: '',
    );

    // Call the repository method to register the user
    return await authRepository.registerUser(authEntity);
  }
}
