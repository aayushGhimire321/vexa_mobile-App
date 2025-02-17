// register_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexa/features/auth/domain/use_case/register_usecase.dart';
import '../../../../../core/network/email_service.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  // Assuming you have an email service to send OTP
  final EmailService _emailService;

  RegisterBloc({required EmailService emailService, required RegisterUseCase registerUseCase})
      : _emailService = emailService,
        super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterRequested) {
      yield* _mapRegisterRequestedToState(event);
    }
    if (event is OtpVerified) {
      yield* _mapOtpVerifiedToState(event);
    }
  }

  Stream<RegisterState> _mapRegisterRequestedToState(RegisterRequested event) async* {
    yield state.copyWith(isLoading: true);
    try {
      // Send OTP to the user's email
      await _emailService.sendOtp(event.email);
      yield state.copyWith(isLoading: false, otpSent: true);
    } catch (e) {
      yield state.copyWith(isLoading: false, errorMessage: 'Failed to send OTP');
    }
  }

  Stream<RegisterState> _mapOtpVerifiedToState(OtpVerified event) async* {
    yield state.copyWith(isLoading: true);
    try {
      // Verify OTP (call your service or backend here)
      bool isOtpValid = await _emailService.verifyOtp(event.otp);
      if (isOtpValid) {
        yield state.copyWith(isLoading: false, isSuccess: true);
      } else {
        yield state.copyWith(isLoading: false, errorMessage: 'Invalid OTP');
      }
    } catch (e) {
      yield state.copyWith(isLoading: false, errorMessage: 'OTP verification failed');
    }
  }
}
