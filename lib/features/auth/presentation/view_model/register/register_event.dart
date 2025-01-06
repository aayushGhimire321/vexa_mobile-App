import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitRegistration extends RegisterEvent {
  final String username;
  final String password;
  final String confirmPassword;

  SubmitRegistration(this.username, this.password, this.confirmPassword);

  @override
  List<Object?> get props => [username, password, confirmPassword];
}
