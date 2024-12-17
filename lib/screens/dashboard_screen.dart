import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stat Cards Row
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
            // Action Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  title: "Create New Project",
                  color: Theme.of(context).primaryColor,
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
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "No projects available",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
