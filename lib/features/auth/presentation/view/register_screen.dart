import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../app/constants/strings.dart';
import '../../../../app/widget/CustomTextField.dart';
import '../../../../app/widget/custom_button.dart';
import '../../../../core/network/api_service.dart';
import '../../../../app/constants/api_endpoints.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  File? _profileImage;
  bool _isLoading = false;
  final ApiService _apiService = ApiService(Dio());

  // Check camera permission
  Future<void> checkCameraPermission() async {
    if (await Permission.camera.request().isDenied ||
        await Permission.camera.request().isRestricted) {
      await Permission.camera.request();
    }
  }

  // Browse image from camera or gallery
  Future<void> _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Register user with API call
  Future<void> _registerUser() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showSnackBar('Please fill in all fields', Colors.red);
      return;
    }

    if (password != confirmPassword) {
      _showSnackBar('Passwords do not match', Colors.red);
      return;
    }

    if (_profileImage == null) {
      _showSnackBar('Please select a profile picture', Colors.red);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Prepare the form data
      FormData formData = FormData.fromMap({
        'name': username,
        'email': email,
        'password': password,
        'profileImage': await MultipartFile.fromFile(_profileImage!.path, filename: 'profile_image.jpg'),
      });

      debugPrint('Form data: $formData'); // Debugging step to ensure correct data

      // Make the API call using ApiService
      var response = await _apiService.dio.post(
        ApiEndpoints.signUp,
        data: formData,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "multipart/form-data",  // Change Content-Type to multipart/form-data
          },
        ),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        _showSnackBar('Registered successfully!', Colors.green);
        Navigator.pop(context); // Navigate to login or home screen after successful registration
      } else {
        _showSnackBar('Registration failed: ${response.data["message"] ?? 'Unknown error'}', Colors.red);
      }
    } catch (e) {
      _showSnackBar('Error: $e', Colors.red);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Show Snackbar
  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: TextStyle(color: Colors.white)), backgroundColor: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              // Title for the screen
              Text(
                'Create Your Vexa Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.grey[300],
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              checkCameraPermission();
                              _browseImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.camera),
                            label: const Text('Camera'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              checkCameraPermission();
                              _browseImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.image),
                            label: const Text('Gallery'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const AssetImage('assets/images/profile.png') as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              CustomTextField(hintText: 'Username', controller: usernameController),
              const SizedBox(height: 10),
              CustomTextField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 10),
              CustomTextField(hintText: 'Password', obscureText: true, controller: passwordController),
              const SizedBox(height: 10),
              CustomTextField(hintText: 'Confirm Password', obscureText: true, controller: confirmPasswordController),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(text: 'Register', onPressed: _registerUser),
              const SizedBox(height: 10),
              const Text('or', style: TextStyle(color: Colors.white70)),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
