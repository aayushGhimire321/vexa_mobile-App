import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends LoginEvent {
  final String username;
  final String password;
  final BuildContext context;

  LoginRequested({required this.username, required this.password, required this.context});

  @override
  List<Object?> get props => [username, password, context];
}

class NavigateDashboardEvent extends LoginEvent {
  final BuildContext context;

  NavigateDashboardEvent({required this.context});

  @override
  List<Object?> get props => [context];
}
