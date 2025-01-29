import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String username;
  final String email;
  final String password;
  final String image;  // Add the missing image property

  const UserEntity({
    this.userId,
    required this.username,
    required this.email,
    required this.password,
    required this.image,  // Ensure the image is required or use a default value if needed
  });

  @override
  List<Object?> get props => [userId, username, email, password, image];  // Include image in props for comparison
}
