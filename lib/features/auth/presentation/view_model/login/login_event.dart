import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends LoginEvent {
  final String username;  // Assuming username is the same as email
  final String password;

  LoginRequested({required this.username, required this.password, required BuildContext context, required String email});

  @override
  List<Object?> get props => [username, password];
}

class NavigateDashboardEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
