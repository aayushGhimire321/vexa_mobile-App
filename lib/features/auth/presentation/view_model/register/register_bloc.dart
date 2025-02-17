import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:vexa/features/auth/domain/use_case/profile_picture_usecase.dart';
import 'package:vexa/features/auth/domain/use_case/register_usecase.dart';
import 'register_event.dart';
import 'register_state.dart';
import 'dart:io';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:3000/api/v1/'));

  RegisterBloc({required Dio dio, required RegisterUseCase registerUseCase, required UploadImageUseCase uploadImageUseCase}) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterUser) {
      yield* _registerUser(event);
    } else if (event is ImageSelectedEvent) {
      // Handle profile image selection if needed
    }
  }

  Stream<RegisterState> _registerUser(RegisterUser event) async* {
    yield RegisterLoading();

    try {
      final response = await _dio.post(
        'auth/register',
        data: {
          'username': event.username,
          'email': event.email,
          'password': event.password,
          'confirmPassword': event.confirmPassword,
          'profileImage': event.profileImagePath, // Handle file upload if needed
        },
      );

      if (response.statusCode == 200) {
        yield RegisterSuccess(message: 'Registration successful');
      } else {
        yield RegisterFailure(error: "Invalid response from server");
      }
    } on DioException catch (e) {
      yield RegisterFailure(error: e.response?.data['message'] ?? "Registration failed");
    }
  }
}
