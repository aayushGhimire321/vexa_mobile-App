import 'package:flutter_test/flutter_test.dart';
import 'package:vexa/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fake_async/fake_async.dart';

void main() {
  group('SplashCubit', () {
    late SplashCubit splashCubit;

    setUp(() {
      splashCubit = SplashCubit();
    });

    test('initial state is false', () {
      expect(splashCubit.state, false);
    });

    test('emits true after 2 seconds delay (controlled)', () {
      // Using fakeAsync to control time
      fakeAsync((async) {
        splashCubit.init();

        // Fast-forward time by 2 seconds
        async.elapse(const Duration(seconds: 2));

        // Check that the stream emits the expected value
        expect(splashCubit.state, true);
      });
    });
  });
}
