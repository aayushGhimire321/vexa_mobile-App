import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String name;
  final String email;
  final String password;
  final String? image; // Nullable image property

  const UserEntity({
    this.userId,
    required this.name,
    required this.email,
    required this.password,
    this.image, // Image can be optional
  });

  // fromJson method: Converts JSON into a UserEntity object
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      image: json['image'],  // Map image from JSON
    );
  }

  // toJson method: Converts a UserEntity object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'image': image ?? '',  // Default to empty string if image is null
    };
  }

  // Override equality and hashcode comparison logic
  @override
  List<Object?> get props => [userId, name, email, password, image];  // Compare image if present

  // Optionally, you can add some methods to validate if the entity is valid
  bool isValid() {
    return name.isNotEmpty && email.isNotEmpty && password.isNotEmpty;
  }
}
