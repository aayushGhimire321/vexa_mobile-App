// register_state.dart
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;
  final bool otpSent;

  const RegisterState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage = '',
    this.otpSent = false,
  });

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMessage, otpSent];

  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool? otpSent,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      otpSent: otpSent ?? this.otpSent,
    );
  }

  factory RegisterState.initial() {
    return const RegisterState(
      isLoading: false,
      isSuccess: false,
      errorMessage: '',
      otpSent: false,
    );
  }
}
