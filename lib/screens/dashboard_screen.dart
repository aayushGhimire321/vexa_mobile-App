import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../widgets/sidebar.dart';
import '../widgets/stat_card.dart';
import '../widgets/action_button.dart';
=======
import '../widgets/stat_card.dart';
import '../widgets/action_button.dart';
import '../widgets/sidebar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedPage = "Dashboard"; // Default page selection

  void _handleSidebarSelection(String page) {
    setState(() {
      selectedPage = page;
    });
  }
>>>>>>> dashboard

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
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
=======
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          selectedPage,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Sidebar(
        onItemSelected: _handleSidebarSelection,
      ),
>>>>>>> dashboard
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
<<<<<<< HEAD
            // First Row: Stat Cards
=======
            // Stat Cards Row
>>>>>>> dashboard
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
<<<<<<< HEAD
            // Second Row: Action Buttons
=======
            // Action Buttons Row
>>>>>>> dashboard
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  title: "Create New Project",
<<<<<<< HEAD
                  color: Colors.purple,
=======
                  color: Theme.of(context).primaryColor,
>>>>>>> dashboard
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
<<<<<<< HEAD
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
=======
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
>>>>>>> dashboard
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "No projects available",
<<<<<<< HEAD
                  style: TextStyle(color: Colors.grey),
=======
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                  ),
>>>>>>> dashboard
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
