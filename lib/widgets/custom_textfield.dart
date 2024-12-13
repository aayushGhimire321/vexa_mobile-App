import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller; // Controller to manage text input
  final String initialText; // Added initialText to set initial value

  // Constructor now takes an optional initialText
  CustomTextField({
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    this.initialText = '', // Default to empty string if not provided
  });

  @override
  Widget build(BuildContext context) {
    // Set the initial text if provided
    if (initialText.isNotEmpty) {
      controller.text = initialText;
    }

    return TextField(
      controller: controller, // Use the controller to manage the text
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white24,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.white),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
