import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterUser extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final String profileImagePath;

  RegisterUser({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.profileImagePath,
  });

  @override
  List<Object?> get props => [username, email, password, confirmPassword, profileImagePath];
}

class ImageSelectedEvent extends RegisterEvent {
  final File image;

  ImageSelectedEvent(this.image);

  @override
  List<Object?> get props => [image];
}
