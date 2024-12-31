import 'package:flutter/material.dart';
import 'package:vexa/screens/communtiy_page.dart';
import 'package:vexa/screens/new_team_page.dart';
import 'package:vexa/screens/projects_page.dart';
import 'package:vexa/screens/settings_page.dart';
import 'package:vexa/screens/your_works_page.dart';

import '../screens/dashboard_screen.dart';

class Sidebar extends StatelessWidget {
  final Function(String) onItemSelected;
  final String selectedItem;

  const Sidebar({
    Key? key,
    required this.onItemSelected,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87, // Sidebar background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              children: [
                Icon(Icons.dashboard, color: Colors.white, size: 28),
                SizedBox(width: 10),
                Text(
                  'VEXA',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Sidebar Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildSidebarItem(
                  context,
                  icon: Icons.dashboard,
                  title: "Dashboard",
                  isSelected: selectedItem == "Dashboard",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  ),
                ),
                _buildSidebarItem(
                  context,
                  icon: Icons.folder_open,
                  title: "Projects",
                  isSelected: selectedItem == "Projects",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectsPage()),
                  ),
                ),
                _buildSidebarItem(
                  context,
                  icon: Icons.work_outline,
                  title: "Your Works",
                  isSelected: selectedItem == "Your Works",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YourWorksPage()),
                  ),
                ),
                _buildSidebarItem(
                  context,
                  icon: Icons.group,
                  title: "Community",
                  isSelected: selectedItem == "Community",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommunityPage()),
                  ),
                ),
                Divider(color: Colors.white24, thickness: 1),
                // Teams Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Teams",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildSidebarItem(
                  context,
                  icon: Icons.add,
                  title: "New Team",
                  isSelected: selectedItem == "New Team",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewTeamPage()),
                  ),
                ),
                Divider(color: Colors.white24, thickness: 1),
                // Settings Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildSidebarItem(
                  context,
                  icon: Icons.settings,
                  title: "Settings",
                  isSelected: selectedItem == "Settings",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Options
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: [
                _buildSidebarItem(
                  context,
                  icon: Icons.wb_sunny,
                  title: "Light Mode",
                  isSelected: selectedItem == "Light Mode",
                  onTap: () => onItemSelected("Light Mode"),
                ),
                _buildSidebarItem(
                  context,
                  icon: Icons.logout,
                  title: "Logout",
                  isSelected: selectedItem == "Logout",
                  onTap: () => onItemSelected("Logout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required bool isSelected,
        required VoidCallback onTap,
      }) {
    return ListTile(
      leading: Tooltip(
        message: title,
        child: Icon(icon, color: isSelected ? Colors.blue : Colors.white70),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: isSelected ? Colors.blue : Colors.white70,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}
