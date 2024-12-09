import 'package:flutter/material.dart';

import 'features/Pages/Home/Home.dart';


void main() {
  runApp(const ProjectManagementApp());
}

class ProjectManagementApp extends StatelessWidget {
  const ProjectManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue, // Set primary color here
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Set text color here
        ),
      ),
      home: Home(),
    );

  }
}
