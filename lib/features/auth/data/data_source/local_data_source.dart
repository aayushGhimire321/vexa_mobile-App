import '../../domain/entity/auth_entity.dart';

// Abstract class for local data source for authentication-related operations
abstract interface class IAuthLocalDataSource {
  // Create a new user
  Future<void> createUser(UserEntity userEntity);

  // Get all users (if needed for your app)
  Future<List<UserEntity>> getAllUsers();

  // Delete a user by their userId
  Future<void> deleteUser(String userId);

  // Retrieve a user by their userId
  Future<UserEntity?> getUserById(String userId);

  // Update user details
  Future<void> updateUser(UserEntity userEntity);
}
