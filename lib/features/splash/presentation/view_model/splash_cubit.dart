import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);  // Initialize with a false state

  /// Initializes splash screen and triggers the navigation after delay
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    // Emit a state after the delay to trigger navigation in the listener
    emit(true);  // Emit 'true' to indicate the splash is finished
  }
}
