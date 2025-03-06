import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name;
  final String email;

  ProfileLoaded({required this.name, required this.email});

  @override
  List<Object?> get props => [name, email];
}

class ProfileUpdated extends ProfileState {
  final String name;
  final String email;

  ProfileUpdated({required this.name, required this.email});

  @override
  List<Object?> get props => [name, email];
}

class ProfileError extends ProfileState {
  final String errorMessage;

  ProfileError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
