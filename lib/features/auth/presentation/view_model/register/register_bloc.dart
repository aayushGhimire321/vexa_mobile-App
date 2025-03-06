import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' show FormData, MultipartFile;
import 'package:dio/src/dio.dart';
import 'package:vexa/features/auth/domain/use_case/profile_picture_usecase.dart';
import 'package:vexa/features/auth/domain/use_case/register_usecase.dart';
import 'package:vexa/features/auth/presentation/view_model/register/register_event.dart';
import 'package:vexa/features/auth/presentation/view_model/register/register_state.dart';

import '../../../../../app/constants/api_endpoints.dart';
import '../../../../../core/network/api_service.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ApiService _apiService;

  RegisterBloc(this._apiService, {required RegisterUseCase registerUseCase, required UploadImageUseCase uploadImageUseCase, required Dio dio}) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterUserEvent) {
      yield RegisterLoading(); // Show loading state

      // Check if password and confirm password match
      if (event.password != event.confirmPassword) {
        yield RegisterFailure('Passwords do not match');
        return;
      }

      // Check if any field is empty
      if (event.username.isEmpty ||
          event.email.isEmpty ||
          event.password.isEmpty ||
          event.confirmPassword.isEmpty) {
        yield RegisterFailure('Please fill in all fields');
        return;
      }

      // Prepare FormData for API call
      try {
        FormData formData = FormData.fromMap({
          'name': event.username,
          'email': event.email,
          'password': event.password,
          if (event.profileImage != null)
            'profileImage': await MultipartFile.fromFile(
              event.profileImage!.path,
              filename: 'profile_image.jpg',
            ),
        });

        // Send API request
        var response = await _apiService.dio.post(ApiEndpoints.signUp, data: formData);

        if (response.statusCode == 201 || response.statusCode == 200) {
          yield RegisterSuccess('Registered successfully!');
        } else {
          yield RegisterFailure('Registration failed: ${response.data["message"] ?? 'Unknown error'}');
        }
      } catch (e) {
        yield RegisterFailure('Error: $e');
      }
    }
  }
}
