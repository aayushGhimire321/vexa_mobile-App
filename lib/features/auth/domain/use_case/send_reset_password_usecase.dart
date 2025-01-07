import '../repository/auth_repository.dart';

class SendResetPasswordUseCase {
  final AuthenticationRepository repository;

  SendResetPasswordUseCase(this.repository);

  Future<void> call(String email) {
    return repository.sendResetPasswordLink(email);
  }
}