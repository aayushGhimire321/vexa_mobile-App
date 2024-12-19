import 'package:flutter/material.dart';

class NepaliTeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nepali")),
      body: Center(
        child: Text(
          "Nepali",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
