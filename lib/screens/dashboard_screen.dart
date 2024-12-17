import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/stat_card.dart';
import '../widgets/action_button.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      drawer: Sidebar(), // Sidebar widget
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        elevation: 0,
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row: Stat Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatCard(
                  title: "Total Projects Done",
                  value: "0",
                  subtitle: "Working on 0 projects",
                ),
                StatCard(
                  title: "Total Task Done",
                  value: "0",
                  subtitle: "0 Tasks are left",
                ),
              ],
            ),
            SizedBox(height: 20),
            // Second Row: Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  title: "Create New Project",
                  color: Colors.purple,
                ),
                ActionButton(
                  title: "Create New Team",
                  color: Colors.amber,
                ),
              ],
            ),
            SizedBox(height: 20),
            // Recent Projects Section
            Text(
              "Recent Projects",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "No projects available",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
