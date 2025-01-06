import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit() : super(null);

  /// Initializes splash screen and triggers the navigation after delay
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    // Emit a state after the delay to trigger navigation in the listener
    emit(null); // Emit null or any state to trigger listener
  }
}
