import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/constants/hive_table_constant.dart';
import '../../features/auth/data/model/auth_hive_model.dart';
import '../../features/dashboard/data/model/dashboard_hive_model.dart';

class HiveService {
  final String userBoxName = HiveTableConstant.userBox;
  final String communityBoxName = HiveTableConstant.communityBox;
  final String dashboardBoxName = HiveTableConstant.dashboardBox;
  final String settingsBoxName = HiveTableConstant.settingsBox;
  final String teamsBoxName = HiveTableConstant.teamsBox;

  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}vexa_project_management.db';
    Hive.init(path);

    // Register all Hive models here
    Hive.registerAdapter(AuthHiveModelAdapter());
    Hive.registerAdapter(DashboardHiveModelAdapter());  // Register DashboardHiveModel adapter
  }

  // User methods
  Future<void> addUser(AuthHiveModel user) async {
    var box = await Hive.openBox<AuthHiveModel>(userBoxName);
    await box.put(user.userId, user);
  }

  Future<void> deleteUser(String userId) async {
    var box = await Hive.openBox<AuthHiveModel>(userBoxName);
    await box.delete(userId);
  }

  Future<List<AuthHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<AuthHiveModel>(userBoxName);
    return box.values.toList();
  }

  Future<AuthHiveModel?> getUserById(String userId) async {
    var box = await Hive.openBox<AuthHiveModel>(userBoxName);
    return box.get(userId);
  }

  Future<void> updateUser(AuthHiveModel user) async {
    var box = await Hive.openBox<AuthHiveModel>(userBoxName);
    await box.put(user.userId, user);
  }

  // Dashboard methods
  Future<void> addDashboard(String dashboardId, DashboardHiveModel dashboard) async {
    var box = await Hive.openBox<DashboardHiveModel>(dashboardBoxName);
    await box.put(dashboardId, dashboard);  // Saving dashboard using dashboardId as key
  }

  Future<void> deleteDashboard(String dashboardId) async {
    var box = await Hive.openBox<DashboardHiveModel>(dashboardBoxName);
    await box.delete(dashboardId);  // Deleting dashboard using dashboardId as key
  }

  Future<List<DashboardHiveModel>> getAllDashboards() async {
    var box = await Hive.openBox<DashboardHiveModel>(dashboardBoxName);
    return box.values.toList();  // Returning all dashboard models from the box
  }

  Future<DashboardHiveModel?> getDashboardById(String dashboardId) async {
    var box = await Hive.openBox<DashboardHiveModel>(dashboardBoxName);
    return box.get(dashboardId);  // Getting specific dashboard by dashboardId
  }

  Future<void> updateDashboard(String dashboardId, DashboardHiveModel dashboard) async {
    var box = await Hive.openBox<DashboardHiveModel>(dashboardBoxName);
    await box.put(dashboardId, dashboard);  // Updating dashboard using dashboardId as key
  }
}
