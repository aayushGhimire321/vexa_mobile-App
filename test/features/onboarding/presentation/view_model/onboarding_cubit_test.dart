import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vexa/features/onboarding/presentation/view_model/onboarding_cubit.dart';

void main() {
  group('OnboardingCubit', () {
    late OnboardingCubit onboardingCubit;

    setUp(() {
      // Initialize the cubit before each test
      onboardingCubit = OnboardingCubit();
    });

    test('initial state is 0', () {
      // Check if the initial state is 0 as per the constructor of the cubit
      expect(onboardingCubit.state, 0);
    });

    test('updates the page index', () {
      // Update the page index and check if the state is updated correctly
      onboardingCubit.updatePageIndex(1);
      expect(onboardingCubit.state, 1);

      onboardingCubit.updatePageIndex(2);
      expect(onboardingCubit.state, 2);
    });

    test('emits the correct state when multiple updates are made', () {
      // Test that the cubit emits the correct sequence of states
      final expectedStates = [1, 2, 3];

      // Listen to the cubit's state stream and check emitted states
      expectLater(
        onboardingCubit.stream,
        emitsInOrder(expectedStates),
      );

      // Emit updates for the page index
      onboardingCubit.updatePageIndex(1);
      onboardingCubit.updatePageIndex(2);
      onboardingCubit.updatePageIndex(3);
    });
  });
}
