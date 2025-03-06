import 'package:flutter/cupertino.dart';

import 'app/app.dart';
import 'app/di/di.dart';
import 'core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var hiveService = HiveService(); // Singleton instance
  await hiveService.init();

  await initDependencies();

  runApp(App());
}
