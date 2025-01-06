import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDashboardData extends DashboardEvent {}

class CreateNewProject extends DashboardEvent {}

class CreateNewTeam extends DashboardEvent {}
