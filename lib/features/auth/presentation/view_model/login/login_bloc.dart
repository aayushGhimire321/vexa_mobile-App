import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../dashboard/presentation/view_model/dashboard/dashboard_event.dart';
import '../../../domain/entity/auth_entity.dart';
import '../../../domain/use_case/login_usecase.dart';
import '../../../../../core/common/snackbar/my_snackbar.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(LoginState.initial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _loginUseCase(
      LoginParams(username: event.username, password: event.password,),
    );

    result.fold(
          (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
          context: event.context,
          message: "Invalid Credentials",
          color: Colors.red,
        );
      },
          (token) {  // token is a String
        emit(state.copyWith(isLoading: false, isSuccess: true, token: token));
        add(NavigateDashboardEvent(context: event.context));
      },
    );

  }
}

