import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/auth_repository.dart';

class LoginUseCase implements UsecaseWithParams<String, LoginParams> {
  final IAuthRepository authrepository;

  LoginUseCase({required this.authrepository});

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    return authrepository.loginUser(params.username, params.password);
  }
}
class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({
    required this.username,
    required this.password,
  });

  // Default constructor to initialize with empty values
  const LoginParams.initial()
      : username = '',
        password = '';

  @override
  List<Object> get props => [username, password];
}