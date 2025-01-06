import 'package:flutter/material.dart';
import 'package:vexa/features/splash/presentation/view/splash_screen.dart';
import 'core/theme/theme.dart';
import 'features/auth/presentation/view/login_screen.dart';
import 'features/onboarding/presentation/view/onboarding_screen.dart';

void main() {
  runApp(const VexaApp());
}

class VexaApp extends StatelessWidget {
  const VexaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vexa',
      theme: AppTheme.darkTheme,  // Use the dark theme defined in theme.dart
      initialRoute: '/splash', // Start at splash screen
      routes: {
        '/splash': (context) =>  SplashScreen(),
        '/onboarding': (context) =>  OnboardingScreen(), // Route for onboarding
        '/login': (context) => LoginScreen(),
      },
      // Optionally, you can check whether onboarding has been completed
      // and set the home to SplashScreen or OnboardingFlow
      home:  SplashScreen(),
    );
  }
}
