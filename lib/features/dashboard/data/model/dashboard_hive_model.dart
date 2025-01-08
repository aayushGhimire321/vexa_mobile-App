import 'package:hive/hive.dart';
import '../../domain/entity/dashboard_entity.dart';

part 'dashboard_hive_model.g.dart'; // This will be generated by Hive (make sure to run `flutter packages pub run build_runner build`)

@HiveType(typeId: 1) // Set a unique ID for this model
class DashboardHiveModel {
  @HiveField(0)
  final int totalProjects;

  @HiveField(1)
  final int totalTasks;

  @HiveField(2)
  final String recentProjectsMessage;

  @HiveField(3)
  final List<dynamic> recentProjects;

  @HiveField(4)
  final int recentProjectsCount; // Added this field

  @HiveField(5)
  final int recentTasksCount; // Added this field

  // Constructor to initialize the model
  DashboardHiveModel({
    required this.totalProjects,
    required this.totalTasks,
    required this.recentProjectsMessage,
    required this.recentProjects,
    required this.recentProjectsCount, // Include in constructor
    required this.recentTasksCount, // Include in constructor
  });

  // Factory method to convert from a DashboardEntity to DashboardHiveModel
  factory DashboardHiveModel.fromEntity(DashboardEntity entity) {
    return DashboardHiveModel(
      totalProjects: entity.totalProjects,
      totalTasks: entity.totalTasks,
      recentProjectsMessage: entity.recentProjectsMessage,
      recentProjectsCount: entity.recentProjectsCount, // Add the required field
      recentTasksCount: entity.recentTasksCount, recentProjects: entity.recentProjects, // Add the required field
    );
  }

  // Method to convert DashboardHiveModel to DashboardEntity
  DashboardEntity toEntity() {
    return DashboardEntity(
      totalProjects: totalProjects,
      totalTasks: totalTasks,
      recentProjectsMessage: recentProjectsMessage,
      recentProjects: recentProjects,
      recentProjectsCount: recentProjectsCount, // Add the required field
      recentTasksCount: recentTasksCount, // Add the required field
    );
  }
}