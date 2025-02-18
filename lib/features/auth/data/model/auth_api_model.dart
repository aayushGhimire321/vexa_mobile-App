import 'package:vexa/features/auth/domain/entity/auth_entity.dart';


class AuthApiModel {
  final String name;
  final String email;
  final String password;

  AuthApiModel({
    required this.name,
    required this.email,
    required this.password,
  });

  /// Convert `AuthApiModel` to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  /// Create an `AuthApiModel` from a JSON object.
  factory AuthApiModel.fromJson(Map<String, dynamic> json) {
    return AuthApiModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  /// Convert `AuthApiModel` to `AuthEntity` (Domain Layer).
  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email,
      password: password, image: '',
    );
  }

  /// Create `AuthApiModel` from `AuthEntity` (Domain Layer).
  factory AuthApiModel.fromEntity(UserEntity entity) {
    return AuthApiModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
    );
  }
}
