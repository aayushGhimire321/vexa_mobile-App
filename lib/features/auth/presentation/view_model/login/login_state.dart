import 'package:equatable/equatable.dart';

/// Base State Class
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Initial state when the screen loads
class LoginInitial extends LoginState {}

/// State when login is in progress
class LoginLoading extends LoginState {}

/// State when login is successful
class LoginSuccess extends LoginState {}

/// State when login fails
class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}
