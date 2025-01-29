import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart'; // Add the equatable package for using props.

import '../../domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart'; // Generate using build_runner

@HiveType(typeId: 0)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId; // Make userId nullable

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  late final String password;

  AuthHiveModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.password,
  });

  factory AuthHiveModel.fromEntity(UserEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      username: entity.username,
      email: entity.email,
      password: entity.password,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      username: username,
      email: email,
      password: password, image: null,
    );
  }

  @override
  List<Object?> get props => [userId, username, email, password];
}
