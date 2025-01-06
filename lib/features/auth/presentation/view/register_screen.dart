import 'package:flutter/material.dart';

import '../../../../app/constants/strings.dart';
import '../../../../app/widget/CustomTextField.dart';
import '../../../../app/widget/custom_button.dart';
 // Import the constants file

class RegisterScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // Set the background color here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              Image.asset(
                AppStrings.registerImage, // Use the constant here
                height: 160,
              ),
              const SizedBox(height: 10),
              const Text(
                'Registration',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Register with the proper credentials',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Username',
                controller: usernameController, // Assign controller
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController, // Assign controller
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: confirmPasswordController, // Assign controller
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Register',
                onPressed: () {
                  String username = usernameController.text.trim();
                  String password = passwordController.text.trim();
                  String confirmPassword = confirmPasswordController.text.trim();

                  if (password != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Passwords do not match',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Registered successfully!',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );

                  // Navigate to the login screen
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'or',
                style: TextStyle(color: Colors.white70),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
