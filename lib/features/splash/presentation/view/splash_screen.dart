import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexa/app/constants/strings.dart';
import 'package:vexa/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:vexa/features/splash/presentation/view_model/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..init(),
      child: BlocListener<SplashCubit, void>(
        listener: (context, state) {
          // No need for condition, navigation will occur once state is emitted
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          );
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  AppStrings.splashLogo, // Use constant for splash logo
                  height: 350,
                ),
                const SizedBox(height: 20),
                const Text(
                  AppStrings.appName, // Use constant for app name
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(), // Loading indicator
              ],
            ),
          ),
        ),
      ),
    );
  }
}
