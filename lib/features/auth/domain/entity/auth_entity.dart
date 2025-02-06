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

  // fromJson method: Converts JSON into a UserEntity object
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['userId'],  // Assuming userId is optional
      username: json['username'],
      email: json['email'],
      password: json['password'],
      image: json['image'],  // Map the image from JSON
    );
  }

  // toJson method: Converts a UserEntity object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'password': password,
      'image': image,  // Include image in the JSON map
    };
  }

  @override
  List<Object?> get props => [userId, username, email, password, image];  // Include image in props for comparison
}
