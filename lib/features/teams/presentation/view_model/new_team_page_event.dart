import 'package:equatable/equatable.dart';

abstract class TeamsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTeams extends TeamsEvent {}

class CreateTeam extends TeamsEvent {
  final String teamName;
  final String description;

  CreateTeam({required this.teamName, required this.description});

  @override
  List<Object?> get props => [teamName, description];
}
