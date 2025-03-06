import 'dart:io';

abstract class RegisterEvent {}

class RegisterUserEvent extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final File? profileImage;

  RegisterUserEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.profileImage,
  });
}
