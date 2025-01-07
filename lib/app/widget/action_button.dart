import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed; // Add onPressed callback

  const ActionButton({
    required this.title,
    required this.color,
    required this.onPressed, // Make onPressed required
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Handle the tap event
      child: Container(
        width: 170,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
