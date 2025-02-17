import 'package:vexa/features/auth/data/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Map<String, dynamic>> call({
    required String username,
    required String email,
    required String password,
  }) async {
    return await authRepository.signUp(
      username: username,
      email: email,
      password: password,
    );
  }
}
