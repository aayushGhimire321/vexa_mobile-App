import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterRequested extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  final BuildContext context;

  RegisterRequested({
    required this.username,
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [username, email, password, context];
}
