// lib/blocs/forgot_password/forgot_password_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/constants/strings.dart';
import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial());

  @override
  Stream<ForgotPasswordState> mapEventToState(ForgotPasswordEvent event) async* {
    if (event is SendResetLinkEvent) {
      yield ForgotPasswordLoading();

      try {
        // Use a more robust email validation method
        if (isValidEmail(event.email)) {
          // Simulate sending a reset email (In a real app, you would call a repository here)
          await Future.delayed(const Duration(seconds: 2));
          yield ForgotPasswordSuccess('${AppStrings.successMessage} ${event.email}');
        } else {
          yield ForgotPasswordError(AppStrings.errorMessage);
        }
      } catch (e) {
        // Catch unexpected errors and yield a generic error
        yield ForgotPasswordError(AppStrings.genericErrorMessage);
      }
    }
  }

  // A more robust email validation method
  bool isValidEmail(String email) {
    // You can replace this with a more comprehensive regex or use a package like email_validator
    return email.isNotEmpty && RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }
}
