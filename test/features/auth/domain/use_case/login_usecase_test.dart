import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vexa/core/error/failure.dart';
import 'package:vexa/features/auth/domain/use_case/login_usecase.dart';
import 'package:vexa/features/auth/domain/repository/auth_repository.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUseCase loginUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(authrepository: mockAuthRepository);
  });

  group('LoginUseCase', () {
    const username = 'testuser';
    const password = 'password123';
    const token = 'valid_token';

    test('should return a token when login is successful', () async {
      // Arrange
      when(() => mockAuthRepository.loginUser(username, password))
          .thenAnswer((_) async => const Right(token));

      // Act
      final result = await loginUseCase(const LoginParams(username: username, password: password));

      // Assert
      expect(result, const Right(token));
      verify(() => mockAuthRepository.loginUser(username, password)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return a ServerFailure when login fails', () async {
      // Arrange
      when(() => mockAuthRepository.loginUser(username, password))
          .thenAnswer((_) async => const Left(ServerFailure(message: 'Server error')));

      // Act
      final result = await loginUseCase(const LoginParams(username: username, password: password));

      // Assert
      expect(result, isA<Left<Failure, String>>());
      expect((result as Left).value, isA<ServerFailure>());
      verify(() => mockAuthRepository.loginUser(username, password)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
