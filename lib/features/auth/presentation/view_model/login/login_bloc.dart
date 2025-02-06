import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<NavigateDashboardEvent>(_onNavigateToDashboard); // Add this handler for navigating
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _loginUseCase(
      LoginParams(username: event.username, password: event.password),
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
          (token) {
        emit(state.copyWith(isLoading: false, isSuccess: true, token: token));
        add(NavigateDashboardEvent(context: event.context)); // Navigate after success
      },
    );
  }

  // This function will be called to handle navigation to the dashboard
  Future<void> _onNavigateToDashboard(
      NavigateDashboardEvent event, Emitter<LoginState> emit) async {
    // You can use the context to navigate to the dashboard
    if (event.context != null) {
      Navigator.pushReplacementNamed(event.context, '/dashboard');
    }
  }
}
