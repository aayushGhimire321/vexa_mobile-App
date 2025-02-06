import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vexa/core/error/failure.dart';
import 'package:vexa/features/auth/domain/repository/auth_repository.dart';
import 'package:vexa/features/auth/domain/use_case/profile_picture_usecase.dart';



class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late UploadImageUseCase uploadImageUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    uploadImageUseCase = UploadImageUseCase(repository: mockAuthRepository);
  });

  final testFile = File('path/to/test_image.jpg');
  const testImageUrl = 'https://example.com/test_image.jpg';
  final uploadParams = UploadImageParams(file: testFile);

  test('should return image URL when upload is successful', () async {
    when(() => mockAuthRepository.uploadProfilePicture(testFile))
        .thenAnswer((_) async => const Right(testImageUrl));

    final result = await uploadImageUseCase(uploadParams);

    expect(result, const Right(testImageUrl));
    verify(() => mockAuthRepository.uploadProfilePicture(testFile)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return Failure when upload fails', () async {
    when(() => mockAuthRepository.uploadProfilePicture(testFile))
        .thenAnswer((_) async => const Left(ServerFailure(message: 'Failure')));

    final result = await uploadImageUseCase(uploadParams);

    expect(result, isA<Left<Failure, String>>());
    verify(() => mockAuthRepository.uploadProfilePicture(testFile)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
