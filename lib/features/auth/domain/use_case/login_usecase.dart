import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final AuthenticationRepository repository;

  LoginUseCase(this.repository);

  Future<AuthenticationEntity> call(String username, String password) {
    return repository.login(username, password);
  }
}