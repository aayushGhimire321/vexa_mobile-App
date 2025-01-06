import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final String correctUsername = "Aayush"; // Mocked data
  final String correctPassword = "12345";

  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    // Simulate login process
    await Future.delayed(const Duration(seconds: 1));

    if (event.username == correctUsername && event.password == correctPassword) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure("Invalid username or password."));
    }
  }
}
