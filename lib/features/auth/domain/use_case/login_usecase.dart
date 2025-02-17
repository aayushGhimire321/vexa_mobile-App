import 'package:vexa/features/auth/data/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Map<String, dynamic>> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.signIn(email: email, password: password);
  }
}
