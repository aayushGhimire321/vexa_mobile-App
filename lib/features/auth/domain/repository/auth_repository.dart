import '../entity/auth_entity.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationEntity> login(String username, String password);
  Future<void> register(String username, String password);
  Future<void> sendResetPasswordLink(String email);
}