import 'package:flutter/material.dart';
import 'package:vexa/themes/theme.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart'; // Import your registration screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vexa App',
      theme: AppTheme.darkTheme,
      initialRoute: '/splash', // Set splash as the initial route
      routes: {
        '/splash': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(), // Add registration route
        '/dashboard': (context) => RegisterScreen(), // Add registration route

      },
    );
  }
}
