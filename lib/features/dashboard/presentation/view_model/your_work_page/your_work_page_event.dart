import 'package:equatable/equatable.dart';

abstract class WorkEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadWorks extends WorkEvent {}

class CreateWork extends WorkEvent {
  final String title;
  final String description;
  final List<String> tags;

  CreateWork({
    required this.title,
    required this.description,
    required this.tags,
  });

  @override
  List<Object?> get props => [title, description, tags];
}
