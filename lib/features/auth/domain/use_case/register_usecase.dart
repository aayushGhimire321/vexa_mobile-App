import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthenticationRepository repository;

  RegisterUseCase(this.repository);

  Future<void> call(String username, String password) {
    return repository.register(username, password);
  }
}