import 'package:equatable/equatable.dart';

/// Base Event Class
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event: When the user submits the login form
class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;

  LoginSubmitted({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
