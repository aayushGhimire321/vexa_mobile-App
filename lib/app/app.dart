import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/theme/theme.dart';
import '../features/auth/presentation/view/forget_password.dart';
import '../features/splash/presentation/view/splash_screen.dart';
import '../features/auth/presentation/view/login_screen.dart'; // Import LoginScreen
import '../features/auth/presentation/view/register_screen.dart'; // Import RegisterScreen
import '../features/dashboard/presentation/view/dashboard_screen.dart'; // Import DashboardScreen
import '../features/splash/presentation/view_model/splash_cubit.dart';
import 'di/di.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Management',
      theme: AppTheme().themeData(isDarkMode: false),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider.value(
          value: getIt<SplashCubit>(),
          child: const SplashScreen(),
        ),
        '/login': (context) => LoginScreen(), // Login screen route
        '/register': (context) => RegisterScreen(), // Register screen route
        't_password': (context) => ForgotPasswordScreen(), // Forget Password screen route
        '/dashboard': (context) => DashboardScreen(), // Dashboard screen route
      },
    );
  }
}
