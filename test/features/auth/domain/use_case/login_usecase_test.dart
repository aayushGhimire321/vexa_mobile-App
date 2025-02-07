import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vexa/core/error/failure.dart';
import 'package:vexa/features/auth/domain/repository/auth_repository.dart';
import 'package:vexa/features/auth/domain/use_case/login_usecase.dart';


class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUseCase loginUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(authrepository: mockAuthRepository);
  });

  const testUsername = 'testuser';
  const testPassword = 'testpass';
  const testToken = 'dummy_token';
  const loginParams = LoginParams(username: testUsername, password: testPassword);

  test('should return token when login is successful', () async {
    when(() => mockAuthRepository.loginUser(testUsername, testPassword))
        .thenAnswer((_) async => const Right(testToken));

    final result = await loginUseCase(loginParams);

    expect(result, const Right(testToken));
    verify(() => mockAuthRepository.loginUser(testUsername, testPassword)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return Failure when login fails', () async {
    when(() => mockAuthRepository.loginUser(testUsername, testPassword))
        .thenAnswer((_) async => const Left(ServerFailure(message: 'Failure')));

    final result = await loginUseCase(loginParams);

    expect(result, isA<Left<Failure, String>>());
    verify(() => mockAuthRepository.loginUser(testUsername, testPassword)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
