import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/constants/hive_table_constant.dart';
import '../../features/auth/data/model/auth_hive_model.dart';

class HiveService {
  // Declare and initialize the box name as a constant
  final String userBoxName = HiveTableConstant.userBox;

  Future<void> init() async {
    // Get directory and initialize the Hive database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}vexa_project_management.db';
    Hive.init(path);

    // Register adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  // User Queries
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
}
