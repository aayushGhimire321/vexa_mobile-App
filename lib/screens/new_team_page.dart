import 'package:flutter/material.dart';

class NewTeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Team")),
      body: Center(
        child: Text(
          "New Team Page Content",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
