import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/auth_repository.dart';

class DeleteUserParams extends Equatable {
  final String userId;

  const DeleteUserParams({required this.userId});

  // Empty constructor
  const DeleteUserParams.empty() : userId = '_empty.string';

  @override
  List<Object?> get props => [userId];
}

class DeleteUserUsecase implements UsecaseWithParams<String, DeleteUserParams> {
  final IAuthRepository userRepository;

  DeleteUserUsecase(this.userRepository);

  @override
  Future<Either<Failure, String>> call(DeleteUserParams params) async {
    final result = await userRepository.deleteUser(params.userId);
    return result.fold(
          (failure) => Left(failure), // Return failure if deletion fails
          (success) => Right('User deleted successfully'), // Success case
    );
  }
}
