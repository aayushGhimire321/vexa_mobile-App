import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vexa/features/auth/domain/use_case/profile_picture_usecase.dart';
import 'package:vexa/features/auth/presentation/view_model/register/register_event.dart';
import 'package:vexa/features/auth/presentation/view_model/register/register_state.dart';

import '../../../../../core/common/snackbar/my_snackbar.dart';
import '../../../domain/use_case/register_usecase.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc({required RegisterUseCase registerUseCase, required UploadImageUseCase uploadImageUsecase})
      : _registerUseCase = registerUseCase,
        super(RegisterState.initial()) {
    on<RegisterRequested>(_onRegisterRequested);
  }

  Future<void> _onRegisterRequested(
      RegisterRequested event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _registerUseCase(
      RegisterUserParams(
        username: event.username,
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
          (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
          context: event.context,
          message: "Registration Failed: ${failure.toString()}",
          color: Colors.red,
        );
      },
          (successMessage) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
          context: event.context,
          color: Colors.green, message: '',
        );
      },
    );
  }
}
