import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/auth_repository.dart';

class UploadImageParams {
  final File file;

  const UploadImageParams({
    required this.file,
  });
}

class UploadImageUseCase implements UsecaseWithParams<String, UploadImageParams> {
  final IAuthRepository _repository;

  // Constructor should accept IAuthRepository as a required named parameter
  UploadImageUseCase({required IAuthRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) async {
    return _repository.uploadProfilePicture(params.file);
  }
}
