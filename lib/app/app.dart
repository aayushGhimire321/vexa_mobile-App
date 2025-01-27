import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart'; // Ensure that getIt is imported
import 'package:vexa/features/splash/presentation/view_model/splash_cubit.dart';

import '../core/theme/theme.dart';
import '../features/splash/presentation/view/splash_screen.dart';
import 'di/di.dart';

//

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Management',
      theme: AppTheme().themeData(isDarkMode: false), // Fix ThemeData initialization
      home: BlocProvider.value(
        value: getIt<SplashCubit>(), // Ensure getIt is correctly used
        child: const SplashScreen(),
      ),
    );
  }
}
