
import 'package:hive/hive.dart';

import '../../domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart'; // Generate using build_runner

@HiveType(typeId: 0)
class AuthHiveModel {
  @HiveField(0)
  final String? userId; // Make userId nullable

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  AuthHiveModel({
    required this.userId, // Adjust if nullable
    required this.username,
    required this.email,
    required this.password,
  });

  factory AuthHiveModel.fromEntity(UserEntity entity) {
    return AuthHiveModel(
      userId: entity.userId, // entity.id is nullable, so this matches
      username: entity.username,
      email: entity.email,
      password: entity.password,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      userId: userId, // Pass nullable userId
      username: username,
      email: email,
      password: password,
    );
  }
}
