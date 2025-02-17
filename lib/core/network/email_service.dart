// email_service.dart
class EmailService {
  Future<void> sendOtp(String email) async {
    // Here, you would implement the logic to send an OTP to the user's email
    // This is a mock implementation for demonstration purposes
    print('Sending OTP to $email');
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
  }

  Future<bool> verifyOtp(String otp) async {
    // Mock OTP verification logic
    // In a real implementation, you would check the OTP against a database or service
    if (otp == '123456') {
      return true;
    } else {
      return false;
    }
  }
}
