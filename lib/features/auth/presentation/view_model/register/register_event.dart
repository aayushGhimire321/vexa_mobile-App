import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterRequested extends RegisterEvent {
  final String username;
  final String email;
  final String password;

  RegisterRequested({
    required this.username,
    required this.email,
    required this.password, required context,
  });

  @override
  List<Object?> get props => [username, email, password];
}
