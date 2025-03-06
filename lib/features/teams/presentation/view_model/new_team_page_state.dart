import 'package:equatable/equatable.dart';

class Team {
  final int id;
  final String name;
  final String description;

  Team({required this.id, required this.name, required this.description});
}

abstract class TeamsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TeamsInitial extends TeamsState {}

class TeamsLoading extends TeamsState {}

class TeamsLoaded extends TeamsState {
  final List<Team> teams;

  TeamsLoaded({required this.teams});

  @override
  List<Object?> get props => [teams];
}

class TeamsError extends TeamsState {
  final String errorMessage;

  TeamsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
