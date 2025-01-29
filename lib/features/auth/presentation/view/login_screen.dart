import 'package:flutter/material.dart';
import 'package:vexa/app/constants/strings.dart';
import 'package:vexa/features/auth/presentation/view/register_screen.dart';

import '../../../../app/widget/CustomTextField.dart';
import '../../../../app/widget/custom_button.dart';
import '../../../dashboard/presentation/view/dashboard_screen.dart';
import '../../domain/use_case/login_usecase.dart';
import 'forget_password.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Assuming you have a login use case that interacts with your backend service
  final LoginUseCase loginUseCase;

  // Constructor that accepts the LoginUseCase
  LoginScreen({required this.loginUseCase});

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
              Image.asset(
                AppStrings.loginImage, // Use the constant here
                height: 160,
              ),
              const SizedBox(height: 10),
              const Text(
                'Login into app',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Login with the registered credentials to use this app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Username',
                controller: usernameController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                onPressed: () async {
                  String username = usernameController.text.trim();
                  String password = passwordController.text.trim();

                  // Call the login use case to authenticate the user
                  final result = await loginUseCase(LoginParams(username: username, password: password));

                  result.fold(
                        (failure) {
                      // Show error if login fails
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Invalid credentials: ${failure.message}',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                        (user) {
                      // If login succeeds, navigate to the dashboard
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Logged in successfully',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardScreen()),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'or',
                style: TextStyle(color: Colors.white70),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  'Register',
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
