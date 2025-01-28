import 'package:equatable/equatable.dart';

class DashboardEntity extends Equatable {
  final int totalProjects;
  final int totalTasks;
  final String recentProjectsMessage;
  final int recentProjectsCount;
  final int recentTasksCount;
  final List<dynamic> recentProjects;  // Added recentProjects

  // Constructor
  DashboardEntity({
    required this.totalProjects,
    required this.totalTasks,
    required this.recentProjectsMessage,
    required this.recentProjectsCount,
    required this.recentTasksCount,
    required this.recentProjects,  // Added recentProjects to constructor
  });

  @override
  List<Object?> get props => [
    totalProjects,
    totalTasks,
    recentProjectsMessage,
    recentProjectsCount,
    recentTasksCount,
    recentProjects,  // Added recentProjects to props
  ];

// Additional methods or data formatting can be added here
}
