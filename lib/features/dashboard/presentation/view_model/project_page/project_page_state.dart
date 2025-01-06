import 'package:equatable/equatable.dart';

abstract class ProjectState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {
  final List<Map<String, dynamic>> projects;

  ProjectLoaded(this.projects);

  @override
  List<Object?> get props => [projects];
}

class ProjectError extends ProjectState {
  final String errorMessage;

  ProjectError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
