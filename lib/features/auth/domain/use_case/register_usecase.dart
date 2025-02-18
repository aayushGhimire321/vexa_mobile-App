import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final IAuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failure, void>> call(RegisterUserParams params) async {
    if (params.email.isEmpty || params.name.isEmpty || params.password.isEmpty) {
      return const Left(InvalidInputFailure(message: 'Invalid input'));
    }

    final authEntity = UserEntity(
      email: params.email,
      name: params.name,
      password: params.password,
      image: '',
    );

    return await authRepository.registerUser(authEntity);
  }
}
class RegisterUserParams {
  final String email;
  final String name;
  final String password;
  final File? profileImage;

  const RegisterUserParams({
    required this.email,
    required this.name,
    required this.password,
    this.profileImage, // profileImage can be null
  });
}