import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vexa/features/auth/domain/use_case/login_usecase.dart';
import 'package:vexa/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:vexa/features/auth/presentation/view_model/login/login_event.dart';
import 'package:vexa/features/auth/presentation/view_model/login/login_state.dart';
import 'package:vexa/core/error/failure.dart';
import 'package:flutter/material.dart';

// Mocks
class MockLoginUseCase extends Mock implements LoginUseCase {}
class MockContext extends Mock implements BuildContext {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late LoginBloc loginBloc;
  late MockContext mockContext;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockContext = MockContext();
    loginBloc = LoginBloc(loginUseCase: mockLoginUseCase);
  });

  test('initial state is LoginState.initial()', () {
    expect(loginBloc.state, LoginState.initial());
  });

  blocTest<LoginBloc, LoginState>(
    'emits [LoginLoading, LoginSuccess] when login is successful',
    build: () {
      when(() => mockLoginUseCase(any()))
          .thenAnswer((_) async => const Right('Login Successful'));
      return loginBloc;
    },
    act: (bloc) => bloc.add(
      LoginRequested(
        email: 'test@example.com',
        password: 'password123',
        context: mockContext, username: 'test', // Pass the mock context if needed
      ),
    ),
    expect: () => [
      LoginState.initial().copyWith(isLoading: true), // LoginLoading state
      LoginState.initial().copyWith(isLoading: false, isSuccess: true), // LoginSuccess state
    ],
    verify: (_) {
      verify(() => mockLoginUseCase(any())).called(1);
    },
  );

  blocTest<LoginBloc, LoginState>(
    'emits [LoginLoading, LoginFailure] when login fails',
    build: () {
      when(() => mockLoginUseCase(any()))
          .thenAnswer((_) async => const Left(ServerFailure(message: 'Error')));
      return loginBloc;
    },
    act: (bloc) => bloc.add(
      LoginRequested(
        email: 'test@example.com',
        password: 'password123',
        context: mockContext, username: 'test', // Pass the mock context if needed
      ),
    ),
    expect: () => [
      LoginState.initial().copyWith(isLoading: true), // LoginLoading state
      LoginState.initial().copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: 'Login Failed: ServerFailure',
      ), // LoginFailure state
    ],
    verify: (_) {
      verify(() => mockLoginUseCase(any())).called(1);
    },
  );
}
