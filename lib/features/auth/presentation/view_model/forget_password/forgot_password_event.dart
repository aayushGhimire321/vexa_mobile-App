// lib/blocs/forgot_password/forgot_password_event.dart
abstract class ForgotPasswordEvent {}

class SendResetLinkEvent extends ForgotPasswordEvent {
  final String email;

  SendResetLinkEvent(this.email);
}
