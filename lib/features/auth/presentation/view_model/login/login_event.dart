import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends LoginEvent {
  final String email;  // Assuming username is the same as email
  final String password;

  LoginRequested({required this.email, required this.password, required BuildContext context});

  @override
  List<Object?> get props => [email, password];
}

class NavigateDashboardEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
