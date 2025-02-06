import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vexa/core/error/failure.dart';
import 'package:vexa/features/auth/domain/use_case/profile_picture_usecase.dart';
import 'package:vexa/features/auth/domain/repository/auth_repository.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late UploadImageUseCase uploadImageUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    uploadImageUseCase = UploadImageUseCase(repository: mockAuthRepository);
  });

  group('UploadImageUseCase', () {
    final file = File('path/to/file.png');

    test('should return image URL when image upload is successful', () async {
      // Arrange
      when(() => mockAuthRepository.uploadProfilePicture(file))
          .thenAnswer((_) async => const Right('image_url'));

      // Act
      final result = await uploadImageUseCase(UploadImageParams(file: file));

      // Assert
      expect(result, const Right('image_url'));
      verify(() => mockAuthRepository.uploadProfilePicture(file)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return ServerFailure when image upload fails', () async {
      // Arrange
      when(() => mockAuthRepository.uploadProfilePicture(file))
          .thenAnswer((_) async => const Left(ServerFailure(message: 'Upload failed')));

      // Act
      final result = await uploadImageUseCase(UploadImageParams(file: file));

      // Assert
      expect(result, isA<Left<Failure, String>>());
      expect((result as Left).value, isA<ServerFailure>());
      verify(() => mockAuthRepository.uploadProfilePicture(file)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
