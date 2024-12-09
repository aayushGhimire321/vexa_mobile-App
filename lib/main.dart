import 'package:flutter/material.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/splash/presentation/pages/splash_page.dart';

void main() {
  runApp(const ProjectManagementApp());
}

class ProjectManagementApp extends StatelessWidget {
  const ProjectManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/dashboard': (context) => const DashboardPage(), // Add Dashboard Page
      },
    );
  }
}
