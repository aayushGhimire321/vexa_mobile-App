import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<SubmitRegistration>((event, emit) async {
      emit(RegisterLoading());
      await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

      if (event.password != event.confirmPassword) {
        emit(RegisterFailure('Passwords do not match'));
        return;
      }

      // Mock successful registration
      emit(RegisterSuccess('Registered successfully!'));
    });
  }
}
