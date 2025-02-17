import 'package:bloc/bloc.dart';
import 'package:vexa/features/auth/presentation/view_model/register/register_event.dart';
import 'package:vexa/features/auth/presentation/view_model/register/register_state.dart';

import '../../../domain/use_case/profile_picture_usecase.dart';
import '../../../domain/use_case/register_usecase.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  final UploadImageUseCase uploadImageUseCase; // Ensure this is properly initialized.

  RegisterBloc({
    required RegisterUseCase registerUseCase,
    required this.uploadImageUseCase,  // This should not be null
  })  : _registerUseCase = registerUseCase,
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
        emit(state.copyWith(isLoading: false, isSuccess: false, errorMessage: "Registration Failed: ${failure.toString()}"));
      },
          (successMessage) {
        emit(state.copyWith(isLoading: false, isSuccess: true, errorMessage: ''));
      },
    );
  }
}
