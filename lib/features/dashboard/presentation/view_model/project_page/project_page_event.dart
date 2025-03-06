import 'package:equatable/equatable.dart';

abstract class ProjectEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProjects extends ProjectEvent {}

class CreateProject extends ProjectEvent {
  final String title;
  final String description;
  final List<String> tags;

  CreateProject({
    required this.title,
    required this.description,
    required this.tags,
  });

  @override
  List<Object?> get props => [title, description, tags];
}
