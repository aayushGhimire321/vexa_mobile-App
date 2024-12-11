import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
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
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                onPressed: () {},
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