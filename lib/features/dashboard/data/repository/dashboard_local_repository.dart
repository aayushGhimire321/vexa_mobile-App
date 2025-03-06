import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entity/dashboard_entity.dart';

import '../../domain/repository/dashboard_repository.dart';
import '../data_source/local_datasource/local_datasource.dart';
import 'dashboard_repository.dart';

class DashboardLocalRepository implements IDashboardRepository {
  final DashboardLocalDataSource _dashboardLocalDataSource;

  DashboardLocalRepository({required DashboardLocalDataSource dashboardLocalDataSource})
      : _dashboardLocalDataSource = dashboardLocalDataSource;

  @override
  Future<Either<Failure, void>> createDashboard(DashboardEntity dashboardEntity) async {
    try {
      await _dashboardLocalDataSource.createDashboard(dashboardEntity);
      return Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error creating dashboard: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDashboard(String dashboardId) async {
    try {
      await _dashboardLocalDataSource.deleteDashboard(dashboardId);
      return Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error deleting dashboard: $e'));
    }
  }

  @override
  Future<Either<Failure, List<DashboardEntity>>> getAllDashboards() async {
    try {
      final dashboards = await _dashboardLocalDataSource.getAllDashboards();
      return Right(dashboards);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error getting all dashboards: $e'));
    }
  }

  @override
  Future<Either<Failure, DashboardEntity?>> getDashboardById(String dashboardId) async {
    try {
      final dashboard = await _dashboardLocalDataSource.getDashboardById(dashboardId);
      return Right(dashboard);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error fetching dashboard by ID: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateDashboard(DashboardEntity dashboardEntity) async {
    try {
      await _dashboardLocalDataSource.updateDashboard(dashboardEntity);
      return Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error updating dashboard: $e'));
    }
  }
}
