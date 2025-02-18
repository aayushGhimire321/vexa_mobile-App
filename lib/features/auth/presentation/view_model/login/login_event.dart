import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends LoginEvent {
  final String name;  // Assuming username is the same as email
  final String password;

  LoginRequested({required this.name, required this.password, required BuildContext context, required String email});

  @override
  List<Object?> get props => [name, password];
}

class NavigateDashboardEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
