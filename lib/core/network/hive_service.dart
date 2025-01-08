import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/constants/hive_table_constant.dart';
import '../../features/auth/data/model/auth_hive_model.dart';
import '../../features/community/data/model/community_hive_model.dart';
import '../../features/dashboard/data/model/dashboard_hive_model.dart';
import '../../features/settings/data/model/settings_hive_model.dart';
import '../../features/teams/data/model/teams_hive_model.dart';

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

    Hive.registerAdapter(AuthHiveModelAdapter());
    Hive.registerAdapter(CommunityHiveModelAdapter());
    Hive.registerAdapter(DashboardHiveModelAdapter());
    Hive.registerAdapter(SettingsHiveModelAdapter());
    Hive.registerAdapter(TeamsHiveModelAdapter());
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

  // Community methods
  Future<void> addCommunity(CommunityHiveModel community) async {
    var box = await Hive.openBox<CommunityHiveModel>(communityBoxName);
    await box.put(community.id, community);
  }

  Future<void> deleteCommunity(String id) async {
    var box = await Hive.openBox<CommunityHiveModel>(communityBoxName);
    await box.delete(id);
  }

  Future<List<CommunityHiveModel>> getAllCommunities() async {
    var box = await Hive.openBox<CommunityHiveModel>(communityBoxName);
    return box.values.toList();
  }

  // Dashboard methods (dashboard_screen, projects_page, your_works_page)
  Future<void> addDashboardItem(DashboardHiveModel item) async {
    var box = await Hive.openBox<DashboardHiveModel>(dashboardBoxName);
    await box.put(item.id, item);
  }

  Future<void> addProject(DashboardHiveModel project) async {
    var box = await Hive.openBox<DashboardHiveModel>(projectBoxName);
    await box.put(project.id, project);
  }

  Future<void> addWork(DashboardHiveModel work) async {
    var box = await Hive.openBox<DashboardHiveModel>(workBoxName);
    await box.put(work.id, work);
  }

  Future<List<DashboardHiveModel>> getAllProjects() async {
    var box = await Hive.openBox<DashboardHiveModel>(projectBoxName);
    return box.values.toList();
  }

  Future<List<DashboardHiveModel>> getAllWorks() async {
    var box = await Hive.openBox<DashboardHiveModel>(workBoxName);
    return box.values.toList();
  }

  // Settings methods (settings_page, profile_screen)
  Future<void> updateSettings(SettingsHiveModel settings) async {
    var box = await Hive.openBox<SettingsHiveModel>(settingsBoxName);
    await box.put(settings.id, settings);
  }

  Future<void> updateProfile(SettingsHiveModel profile) async {
    var box = await Hive.openBox<SettingsHiveModel>(profileBoxName);
    await box.put(profile.id, profile);
  }

  Future<SettingsHiveModel?> getSettings(String id) async {
    var box = await Hive.openBox<SettingsHiveModel>(settingsBoxName);
    return box.get(id);
  }

  Future<SettingsHiveModel?> getProfile(String id) async {
    var box = await Hive.openBox<SettingsHiveModel>(profileBoxName);
    return box.get(id);
  }

  // Teams methods
  Future<void> addTeam(TeamsHiveModel team) async {
    var box = await Hive.openBox<TeamsHiveModel>(teamsBoxName);
    await box.put(team.id, team);
  }

  Future<List<TeamsHiveModel>> getAllTeams() async {
    var box = await Hive.openBox<TeamsHiveModel>(teamsBoxName);
    return box.values.toList();
  }
}
