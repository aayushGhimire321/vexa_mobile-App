import 'package:flutter/material.dart';

import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/onboarding1.png",
      "title": "Welcome to Vexa",
      "description": "Discover a seamless way to connect and share ideas.",
    },
    {
      "image": "assets/images/onboarding2.png",
      "title": "Collaborate Efficiently",
      "description": "Work together with your team in real time.",
    },
    {
      "image": "assets/images/onboarding3.png",
      "title": "Achieve Your Goals",
      "description": "Stay organized and accomplish tasks effectively.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // Use primaryColor from theme
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  image: _onboardingData[index]['image']!,
                  title: _onboardingData[index]['title']!,
                  description: _onboardingData[index]['description']!,
                );
              },
            ),
          ),
          OnboardingIndicator(
            currentIndex: _currentIndex,
            total: _onboardingData.length,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Theme.of(context).hintColor), // Use hintColor
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).hintColor, // Use hintColor for button
                  ),
                  onPressed: () {
                    if (_currentIndex == _onboardingData.length - 1) {
                      Navigator.pushReplacementNamed(context, '/login');
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    _currentIndex == _onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
