import 'package:flutter/material.dart';
import 'package:vexa/screens/splash_screen.dart';
import 'package:vexa/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vexa',
      theme: AppTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}