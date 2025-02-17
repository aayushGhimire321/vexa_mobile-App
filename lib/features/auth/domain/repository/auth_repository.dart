abstract class IAuthRepository {
  Future<Map<String, dynamic>> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> signIn({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> googleSignIn(String token);

  Future<Map<String, dynamic>> findUserByEmail(String email);

  Future<Map<String, dynamic>> generateOtp(String email);

  Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String otp,
  });

  Future<Map<String, dynamic>> resetPassword({
    required String email,
    required String newPassword,
  });
  // Add this method for uploading the profile picture
  Future<String> uploadProfilePicture({required String userId, required String filePath});
}
