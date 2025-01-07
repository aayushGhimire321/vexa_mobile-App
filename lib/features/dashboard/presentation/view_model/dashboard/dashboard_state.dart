import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final int totalProjects;
  final int totalTasks;
  final String recentProjectsMessage;

  DashboardLoaded({
    required this.totalProjects,
    required this.totalTasks,
    required this.recentProjectsMessage,
  });

  @override
  List<Object?> get props => [totalProjects, totalTasks, recentProjectsMessage];
}

class DashboardError extends DashboardState {
  final String errorMessage;

  DashboardError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
