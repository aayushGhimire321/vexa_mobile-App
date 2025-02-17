import 'package:dartz/dartz.dart';
import 'package:vexa/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error/failure.dart';
import '../../data/repository/auth_repository.dart';

class ProfilePictureUseCase {
  final AuthRepository authRepository;

  ProfilePictureUseCase({required this.authRepository});

  Future<Either<Failure, String>> uploadProfilePicture({
    required String userId,
    required String filePath,
  }) async {
    try {
      final result = await authRepository.uploadProfilePicture(
        userId: userId,
        filePath: filePath,
      );
      return Right(result); // Return success message
    } catch (e) {
      return Left(ServerFailure(message: 'Error')); // Handle failure if any error occurs
    }
  }
}
