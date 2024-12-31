import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int total;

  const OnboardingIndicator({
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        total,
            (index) =>
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentIndex == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
      ),
    );
  }
}
