import '../../../../../core/network/hive_service.dart';
import '../../../domain/entity/dashboard_entity.dart';
import '../../model/dashboard_hive_model.dart';
import '../local_data_source.dart';

class DashboardLocalDataSource implements IDashboardLocalDataSource {
  final HiveService _hiveService;
  DashboardLocalDataSource(this._hiveService);

  @override
  Future<void> createDashboard(DashboardEntity dashboardEntity) async {
    try {
      final dashboardHiveModel = DashboardHiveModel.fromEntity(dashboardEntity);
      await _hiveService.addDashboard('dashboardId', dashboardHiveModel); // Use a unique ID for the dashboard
    } catch (e) {
      throw Exception('Failed to create dashboard: $e');
    }
  }

  @override
  Future<void> deleteDashboard(String dashboardId) async {
    try {
      await _hiveService.deleteDashboard(dashboardId); // Use dashboardId
    } catch (e) {
      throw Exception('Failed to delete dashboard: $e');
    }
  }

  @override
  Future<List<DashboardEntity>> getAllDashboards() async {
    try {
      final dashboardsHiveModels = await _hiveService.getAllDashboards();
      return dashboardsHiveModels.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to fetch all dashboards: $e');
    }
  }

  @override
  Future<DashboardEntity?> getDashboardById(String dashboardId) async {
    try {
      final dashboardHiveModel = await _hiveService.getDashboardById(dashboardId);
      return dashboardHiveModel?.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch dashboard: $e');
    }
  }

  @override
  Future<void> updateDashboard(DashboardEntity dashboardEntity) async {
    try {
      final dashboardHiveModel = DashboardHiveModel.fromEntity(dashboardEntity);
      await _hiveService.updateDashboard('dashboardId', dashboardHiveModel); // Use a unique ID for the dashboard
    } catch (e) {
      throw Exception('Failed to update dashboard: $e');
    }
  }
}
