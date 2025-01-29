import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vexa/features/auth/presentation/view_model/register/register_event.dart';

import '../../../../../core/common/snackbar/my_snackbar.dart';
import '../../../domain/use_case/profile_picture_usecase.dart';
import '../../../domain/use_case/register_usecase.dart';

part  'register_state.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  final UploadImageUseCase _uploadImageUsecase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
    required UploadImageUseCase uploadImageUsecase,
  })  : _registerUseCase = registerUseCase,
        _uploadImageUsecase = uploadImageUsecase,
        super(RegisterState.initial()) {
    on<RegisterUser>(_onRegisterUser);
    on<LoadImage>(_onLoadImage);
  }

  // Handle user registration
  void _onRegisterUser(
      RegisterUser event,
      Emitter<RegisterState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _registerUseCase.call(RegisterUserParams(
      email: event.email,
      username: event.username,
      password: event.password,
      profileImage: event.profileImage,
    ));

    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, isSuccess: false)),
          (success) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
          context: event.context,
          message: "User registered successfully!",
        );
      },
    );
  }

  // Handle profile image upload
  void _onLoadImage(
      LoadImage event,
      Emitter<RegisterState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _uploadImageUsecase.call(
      UploadImageParams(file: event.file),
    );

    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, isSuccess: false)),
          (imageUrl) {
        emit(state.copyWith(isLoading: false, isSuccess: true, imageName: imageUrl));
      },
    );
  }
}
