import 'package:flutter/material.dart';

class YourWorksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Works")),
      body: Center(
        child: Text(
          "Your Works Page Content",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
