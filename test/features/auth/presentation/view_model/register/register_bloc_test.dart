import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vexa/features/auth/domain/use_case/profile_picture_usecase.dart';
import 'package:vexa/features/auth/domain/use_case/register_usecase.dart';
import 'package:vexa/features/auth/presentation/view_model/register/register_bloc.dart';
import 'package:vexa/features/auth/presentation/view_model/register/register_event.dart';
import 'package:vexa/features/auth/presentation/view_model/register/register_state.dart';
import 'package:vexa/core/error/failure.dart';
import 'package:flutter/material.dart'; // Import for BuildContext

// Mock classes
class MockRegisterUseCase extends Mock implements RegisterUseCase {}
class MockUploadImageUseCase extends Mock implements UploadImageUseCase {}
class MockContext extends Mock implements BuildContext {}

void main() {
  late MockRegisterUseCase mockRegisterUseCase;
  late MockUploadImageUseCase mockUploadImageUseCase; // Declare the mock for UploadImageUseCase
  late RegisterBloc registerBloc;
  late MockContext mockContext;

  setUp(() {
    mockRegisterUseCase = MockRegisterUseCase();
    mockUploadImageUseCase = MockUploadImageUseCase(); // Initialize the mock for UploadImageUseCase
    mockContext = MockContext(); // Create a mock context
    registerBloc = RegisterBloc(
      registerUseCase: mockRegisterUseCase,
      uploadImageUseCase: mockUploadImageUseCase, // Pass the mock to the RegisterBloc constructor
    );
  });

  test('initial state is RegisterState.initial()', () {
    expect(registerBloc.state, RegisterState.initial());
  });

  blocTest<RegisterBloc, RegisterState>(
    'emits [RegisterLoading, RegisterSuccess] when registration is successful',
    build: () {
      when(() => mockRegisterUseCase(any()))
          .thenAnswer((_) async => const Right('Success'));
      return registerBloc;
    },
    act: (bloc) => bloc.add(
      RegisterRequested(
        username: 'test_user',
        email: 'test@example.com',  // Added email parameter
        password: 'password123',
        context: mockContext,
      ),
    ),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true), // RegisterLoading state
      RegisterState.initial().copyWith(isLoading: false, isSuccess: true), // RegisterSuccess state
    ],
    verify: (_) {
      verify(() => mockRegisterUseCase(any())).called(1);
    },
  );

  blocTest<RegisterBloc, RegisterState>(
    'emits [RegisterLoading, RegisterFailure] when registration fails',
    build: () {
      when(() => mockRegisterUseCase(any()))
          .thenAnswer((_) async => const Left(ServerFailure(message: 'Error')));
      return registerBloc;
    },
    act: (bloc) => bloc.add(
      RegisterRequested(
        username: 'test_user',
        email: 'test@example.com',  // Added email parameter
        password: 'password123',
        context: mockContext,
      ),
    ),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true), // RegisterLoading state
      RegisterState.initial().copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: 'Registration Failed: ServerFailure',
      ), // RegisterFailure state
    ],
    verify: (_) {
      verify(() => mockRegisterUseCase(any())).called(1);
    },
  );
}
