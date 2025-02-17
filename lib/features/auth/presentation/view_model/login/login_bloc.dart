import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexa/features/auth/domain/use_case/login_usecase.dart';
import '../../../data/repository/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository, required LoginUseCase loginUseCase}) : super(LoginState()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));

    final response = await authRepository.signIn(
      email: event.username,
      password: event.password,
    );

    if (response.containsKey("error")) {
      emit(state.copyWith(isLoading: false, errorMessage: response["error"]));
    } else {
      emit(state.copyWith(isLoading: false, isSuccess: true));
    }
  }
}
