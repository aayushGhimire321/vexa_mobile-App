import '../../domain/entity/dashboard_entity.dart';

abstract class IDashboardLocalDataSource {
  Future<void> createDashboard(DashboardEntity dashboardEntity);
  Future<void> deleteDashboard(String dashboardId);
  Future<List<DashboardEntity>> getAllDashboards();
  Future<DashboardEntity?> getDashboardById(String dashboardId);
  Future<void> updateDashboard(DashboardEntity dashboardEntity);
}
