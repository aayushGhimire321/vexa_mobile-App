import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vexa/core/error/failure.dart';
import 'package:vexa/features/auth/domain/entity/auth_entity.dart';
import 'package:vexa/features/auth/domain/repository/auth_repository.dart';
import 'package:vexa/features/auth/domain/use_case/register_usecase.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late RegisterUseCase registerUseCase;

  setUpAll(() {
    // Register a fallback value for UserEntity
    registerFallbackValue(const UserEntity( email: 'dummy@example.com', username: 'dummyUser', password: 'dummy', image: ''));

    // If UserEntity is a function, use a fake class:
    // class UserEntityFake extends Fake implements UserEntity {}
    // registerFallbackValue(UserEntityFake());
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    registerUseCase = RegisterUseCase(authRepository: mockAuthRepository);
  });

  group('RegisterUseCase', () {
    const email = 'test@example.com';
    const username = 'newuser';
    const password = 'password123';

    test('should return success when registration is successful', () async {
      // Arrange
      when(() => mockAuthRepository.registerUser(any()))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await registerUseCase(const RegisterUserParams(
        email: email,
        username: username,
        password: password,
      ));

      // Assert
      expect(result, const Right(null));
      verify(() => mockAuthRepository.registerUser(any())).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return a ServerFailure when registration fails', () async {
      // Arrange
      when(() => mockAuthRepository.registerUser(any()))
          .thenAnswer((_) async => const Left(ServerFailure(message: 'Server error')));

      // Act
      final result = await registerUseCase(const RegisterUserParams(
        email: email,
        username: username,
        password: password,
      ));

      // Assert
      expect(result, isA<Left<Failure, void>>());
      expect((result as Left).value, isA<ServerFailure>());
      verify(() => mockAuthRepository.registerUser(any())).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return InvalidInputFailure when input is invalid', () async {
      // Act
      final result = await registerUseCase(const RegisterUserParams(
        email: '',
        username: '',
        password: '',
      ));

      // Assert
      expect(result, isA<Left<Failure, void>>());
      expect((result as Left).value, isA<InvalidInputFailure>());
    });
  });
}
