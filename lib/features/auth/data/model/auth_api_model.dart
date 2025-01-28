import 'package:vexa/features/auth/domain/entity/auth_entity.dart';


class AuthApiModel {
  final String username;
  final String email;
  final String password;

  AuthApiModel({
    required this.username,
    required this.email,
    required this.password,
  });

  /// Convert `AuthApiModel` to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  /// Create an `AuthApiModel` from a JSON object.
  factory AuthApiModel.fromJson(Map<String, dynamic> json) {
    return AuthApiModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  /// Convert `AuthApiModel` to `AuthEntity` (Domain Layer).
  UserEntity toEntity() {
    return UserEntity(
      username: username,
      email: email,
      password: password,
    );
  }

  /// Create `AuthApiModel` from `AuthEntity` (Domain Layer).
  factory AuthApiModel.fromEntity(UserEntity entity) {
    return AuthApiModel(
      username: entity.username,
      email: entity.email,
      password: entity.password,
    );
  }
}
