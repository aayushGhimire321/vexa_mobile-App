
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';


class RegisterScreen extends StatelessWidget {
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
                'assets/images/register.png',
                height: 160,
              ),
              SizedBox(height: 10),
              Text(
                'Registration',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Register with the proper credentials',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                hintText: 'Username', controller: null,
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'Password',
                obscureText: true, controller: null,
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'Confirm Password',
                obscureText: true, controller: null,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Register',
                onPressed: () {},
              ),
              SizedBox(height: 10),
              Text(
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
