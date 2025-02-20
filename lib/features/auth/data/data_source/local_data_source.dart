
import '../../domain/entity/auth_entity.dart';

abstract interface class IAuthLocalDataSource {
  Future<void> createUser(UserEntity userEntity);
  Future<List<UserEntity>> getAllUsers();
  Future<void> deleteUser(String userId);
  Future<UserEntity?> getUserById(String userId);
  Future<void> updateUser(UserEntity userEntity);
}
