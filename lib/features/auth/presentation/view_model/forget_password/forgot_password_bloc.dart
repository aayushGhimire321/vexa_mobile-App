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
        if (event.email.isNotEmpty && event.email.contains('@')) {
          // Simulate sending a reset email (In a real app, you would call a repository here)
          await Future.delayed(Duration(seconds: 2));
          yield ForgotPasswordSuccess(AppStrings.successMessage + ' ' + event.email);
        } else {
          yield ForgotPasswordError(AppStrings.errorMessage);
        }
      } catch (e) {
        yield ForgotPasswordError(AppStrings.genericErrorMessage);
      }
    }
  }
}
