import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexa/app/constants/strings.dart';
import 'package:vexa/app/widget/onboarding_indicator.dart';
import 'package:vexa/app/widget/onboarding_page.dart';
import 'package:vexa/features/onboarding/presentation/view_model/onboarding_cubit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;  // Declare the PageController

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Initialize the PageController
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            // PageView
            Expanded(
              child: BlocBuilder<OnboardingCubit, int>(
                builder: (context, currentIndex) {
                  return PageView.builder(
                    controller: _pageController,  // Pass the controller to the PageView
                    onPageChanged: (index) =>
                        context.read<OnboardingCubit>().updatePageIndex(index),
                    itemCount: AppStrings.onboardingData.length,
                    itemBuilder: (context, index) {
                      final data = AppStrings.onboardingData[index];
                      return OnboardingPage(
                        image: data['image']!,
                        title: data['title']!,
                        description: data['description']!,
                      );
                    },
                  );
                },
              ),
            ),

            // Indicator
            BlocBuilder<OnboardingCubit, int>(
              builder: (context, currentIndex) {
                return OnboardingIndicator(
                  currentIndex: currentIndex,
                  total: AppStrings.onboardingData.length,
                );
              },
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _navigateToLogin(context),
                    child: Text(
                      AppStrings.skip,
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                  ),
                  BlocBuilder<OnboardingCubit, int>(
                    builder: (context, currentIndex) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).hintColor,
                        ),
                        onPressed: () {
                          if (currentIndex ==
                              AppStrings.onboardingData.length - 1) {
                            _navigateToLogin(context);
                          } else {
                            // Ensure PageController is being accessed after it's built
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: Text(
                          currentIndex ==
                              AppStrings.onboardingData.length - 1
                              ? AppStrings.getStarted
                              : AppStrings.next,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
