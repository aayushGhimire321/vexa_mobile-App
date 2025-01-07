import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';


class GetAllUsersParams extends Equatable {
  const GetAllUsersParams();

  @override
  List<Object?> get props => [];
}

class GetAllUsersUsecase implements UsecaseWithoutParams<List<UserEntity>> {
  final IUserRepository userRepository;

  GetAllUsersUsecase(this.userRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> call() {
    return userRepository.getAllUsers();
  }
}
