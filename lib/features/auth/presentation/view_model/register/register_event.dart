import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

// Event to load profile image
class LoadImage extends RegisterEvent {
  final File file;

  const LoadImage({required this.file});

  @override
  List<Object> get props => [file];
}

// Event to register a user
class RegisterUser extends RegisterEvent {
  final BuildContext context;
  final String email;
  final String username;
  final String password;
  final File? profileImage; // Optional profile image

  const RegisterUser({
    required this.context,
    required this.email,
    required this.username,
    required this.password,
    this.profileImage,
  });

  @override
  List<Object> get props => [
    email,
    username,
    password,
    profileImage ?? File(''), // Ensure null safety
  ];
}
