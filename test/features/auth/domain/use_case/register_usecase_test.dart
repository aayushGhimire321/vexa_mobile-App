import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vexa/core/error/failure.dart';
import 'package:vexa/features/auth/domain/entity/auth_entity.dart';
import 'package:vexa/features/auth/domain/repository/auth_repository.dart';
import 'package:vexa/features/auth/domain/use_case/register_usecase.dart';



class MockAuthRepository extends Mock implements IAuthRepository {}

class FakeUserEntity extends Fake implements UserEntity {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late RegisterUseCase registerUseCase;

  setUpAll(() {
    registerFallbackValue(FakeUserEntity());
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    registerUseCase = RegisterUseCase(authRepository: mockAuthRepository);
  });

  const testEmail = 'test@example.com';
  const testUsername = 'testuser';
  const testPassword = 'password123';
  final testProfileImage = File('path/to/test_image.jpg');
  final registerParams = RegisterUserParams(
    email: testEmail,
    username: testUsername,
    password: testPassword,
    profileImage: testProfileImage,
  );

  test('should return void when registration is successful', () async {
    final userEntity = UserEntity(
      email: testEmail,
      username: testUsername,
      password: testPassword,
      image: '',
    );

    when(() => mockAuthRepository.registerUser(userEntity))
        .thenAnswer((_) async => const Right(null));

    final result = await registerUseCase(registerParams);

    expect(result, const Right(null));
    verify(() => mockAuthRepository.registerUser(userEntity)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return Failure when registration fails', () async {
    final userEntity = UserEntity(
      email: testEmail,
      username: testUsername,
      password: testPassword,
      image: '',
    );

    when(() => mockAuthRepository.registerUser(userEntity))
        .thenAnswer((_) async => Left(ServerFailure(message: 'err')));

    final result = await registerUseCase(registerParams);

    expect(result, isA<Left<Failure, void>>());
    verify(() => mockAuthRepository.registerUser(userEntity)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return InvalidInputFailure when input is invalid', () async {
    final invalidParams = RegisterUserParams(
      email: '',
      username: '',
      password: '',
    );

    final result = await registerUseCase(invalidParams);

    expect(result, equals(const Left(InvalidInputFailure(message: 'Invalid input'))));
    verifyNever(() => mockAuthRepository.registerUser(any()));
  });
}