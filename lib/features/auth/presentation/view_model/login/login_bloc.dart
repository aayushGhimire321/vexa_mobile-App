import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:vexa/features/auth/domain/use_case/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:3000/api/v1/')); // Use your backend URL

  LoginBloc({required LoginUseCase loginUseCase}) : super(LoginState.initial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: "", isSuccess: false));

    try {
      final response = await _dio.post(
        'auth/signin',
        data: {
          'email': event.username, // Assuming email is used for login
          'password': event.password,
        },
      );

      if (response.statusCode == 200) {
        emit(state.copyWith(isSuccess: true, isLoading: false));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: "Invalid response from server"));
      }
    } on DioException catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.response?.data['message'] ?? "Login failed",
      ));
    }
  }
}
