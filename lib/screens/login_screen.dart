import 'package:flutter/material.dart';
import 'package:vexa/screens/register_screen.dart';
import 'package:vexa/screens/dashboard_screen.dart'; // Import the DashboardScreen


import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  final String correctUsername = "Aayush";
  final String correctPassword = "12345";

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // Set the background color here
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              Image.asset(
                'assets/images/login.png',
                height: 160,
              ),
              SizedBox(height: 10),
              Text(
                'Login into app',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Login with the registered credentials to use this app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                hintText: 'Username',
                controller: usernameController, // Bind to the username controller
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController, // Bind to the password controller
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  // Navigate to the DashboardScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );

                  String username = usernameController.text.trim();
                  String password = passwordController.text.trim();

                  if (username == correctUsername && password == correctPassword) {
                    // If credentials are correct
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Logged in successfully',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // Navigate to the DashboardScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()),
                    );
                  } else {
                    // If credentials are incorrect
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Invalid credentials',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }

                },
              ),
              SizedBox(height: 10),
              Text(
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
