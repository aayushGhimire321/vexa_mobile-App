import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../../app/constants/server_exception.dart';
import '../../../domain/entity/auth_entity.dart';
import '../../model/auth_api_model.dart';
import '../local_data_source.dart';

abstract class AuthRemoteDataSource implements IAuthLocalDataSource {
  final String baseUrl;
  final http.Client client;

  AuthRemoteDataSource({required this.baseUrl, required this.client});

  @override
  Future<void> registerUser(UserEntity userEntity) async {
    final url = Uri.parse('$baseUrl/register');
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': userEntity.username,
          'password': userEntity.password,
          'email': userEntity.email,
        }),
      );

      if (response.statusCode != 200) {
        throw ServerException('Failed to register user: ${response.body}');
      }
    } catch (e) {
      throw ServerException('Failed to register user: $e');
    }
  }

  @override
  Future<UserEntity?> loginUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = AuthApiModel.fromJson(data);
        return user.toEntity(); // Converts the API model to UserEntity
      } else {
        throw ServerException('Invalid username or password');
      }
    } catch (e) {
      throw ServerException('Failed to log in: $e');
    }
  }

  @override
  Future<void> uploadProfilePicture(File file) async {
    final url = Uri.parse('$baseUrl/uploadProfilePicture');
    try {
      final request = http.MultipartRequest('POST', url)
        ..headers['Content-Type'] = 'multipart/form-data'
        ..files.add(await http.MultipartFile.fromPath('file', file.path));

      final response = await request.send();
      if (response.statusCode != 200) {
        throw ServerException('Failed to upload profile picture');
      }
    } catch (e) {
      throw ServerException('Failed to upload profile picture: $e');
    }
  }

  @override
  Future<UserEntity> getCurrentUser() async {
    final url = Uri.parse('$baseUrl/currentUser');
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = AuthApiModel.fromJson(data);
        return user.toEntity(); // Converts the API model to UserEntity
      } else {
        throw ServerException('Failed to fetch current user');
      }
    } catch (e) {
      throw ServerException('Failed to fetch current user: $e');
    }
  }

  @override
  Future<List<UserEntity>> getUsersInProject(String projectId) async {
    final url = Uri.parse('$baseUrl/project/$projectId/users');
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final users = (data as List)
            .map((userData) => AuthApiModel.fromJson(userData))
            .toList();
        return users.map((user) => user.toEntity()).toList();
      } else {
        throw ServerException('Failed to fetch users in project');
      }
    } catch (e) {
      throw ServerException('Failed to fetch users in project: $e');
    }
  }
}
