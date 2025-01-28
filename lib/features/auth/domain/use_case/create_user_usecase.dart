import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class CreateUserParams extends Equatable {
  final String username;
  final String password;
  final String email;

  const CreateUserParams({required this.username, required this.password, required this.email});

  // Empty constructor
  const CreateUserParams.empty()
      : username = '_empty.string',
        password = '_empty.string',
        email = '_empty.string';

  @override
  List<Object?> get props => [username, password, email];
}

class CreateUserUsecase implements UsecaseWithParams<String, CreateUserParams> {
  final IAuthRepository userRepository;

  CreateUserUsecase({required this.userRepository});

  @override
  Future<Either<Failure, String>> call(CreateUserParams params) async {
    return await userRepository.createUser(
      UserEntity(username: params.username, password: params.password, email: params.email),
    );
  }
}
