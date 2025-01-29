import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/widget/CustomTextField.dart';
import '../../../../app/widget/custom_button.dart';
import '../../../dashboard/presentation/view/dashboard_screen.dart';
import '../view_model/login/login_bloc.dart';
import '../view_model/login/login_event.dart';
import '../view_model/login/login_state.dart';
import 'forget_password.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                'assets/login_image.png', // Placeholder
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
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
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
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid credentials: ${state.message}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }

                  if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Logged in successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  }

                  return CustomButton(
                    text: 'Login',
                    onPressed: () {
                      String username = usernameController.text.trim();
                      String password = passwordController.text.trim();

                      // Dispatch the LoginRequested event
                      BlocProvider.of<LoginBloc>(context).add(
                        LoginRequested(username: username, password: password),
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
