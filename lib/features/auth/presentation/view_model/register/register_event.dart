// register_event.dart
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterRequested extends RegisterEvent {
  final String username;
  final String password;
  final String confirmPassword;
  final String email; // Add email for OTP

  const RegisterRequested({
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.email,
  });

  @override
  List<Object> get props => [username, password, confirmPassword, email];
}

class OtpVerified extends RegisterEvent {
  final String otp;
  const OtpVerified(this.otp);

  @override
  List<Object> get props => [otp];
}
