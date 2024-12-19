import 'package:flutter/material.dart';

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
          _buildSidebarItem(
            context,
            icon: Icons.dashboard,
            title: "Dashboard",
            isSelected: selectedItem == "DashboardPage",
            onTap: () => _navigateToPage(context, "DashboardPage"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.folder_open,
            title: "Projects",
            isSelected: selectedItem == "ProjectsPage",
            onTap: () => _navigateToPage(context, "ProjectsPage"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.work_outline,
            title: "Your Works",
            isSelected: selectedItem == "YourWorksPage",
            onTap: () => _navigateToPage(context, "YourWorksPage"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.group,
            title: "Community",
            isSelected: selectedItem == "CommunityPage",
            onTap: () => _navigateToPage(context, "CommunityPage"),
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
            icon: Icons.group,
            title: "Nepali",
            isSelected: selectedItem == "NepaliTeamPage",
            onTap: () => _navigateToPage(context, "NepaliTeamPage"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.add,
            title: "New Team",
            isSelected: selectedItem == "NewTeamPage",
            onTap: () => _navigateToPage(context, "NewTeamPage"),
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
            isSelected: selectedItem == "SettingsPage",
            onTap: () => _navigateToPage(context, "SettingsPage"),
          ),
          Spacer(), // Push the bottom options to the bottom
          // Bottom Options
          _buildSidebarItem(
            context,
            icon: Icons.wb_sunny,
            title: "Light Mode",
            isSelected: selectedItem == "LightModePage",
            onTap: () => _toggleTheme(context),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.logout,
            title: "Logout",
            isSelected: selectedItem == "LogoutPage",
            onTap: () => _navigateToPage(context, "LogoutPage"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(BuildContext context,
      {required IconData icon,
        required String title,
        required bool isSelected,
        required VoidCallback onTap}) {
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

  void _navigateToPage(BuildContext context, String pageName) {
    Navigator.pop(context); // Close the drawer
    try {
      Navigator.pushNamed(context, pageName); // Navigate to the respective page
      onItemSelected(pageName); // Optional: Trigger callback for additional handling
    } catch (e) {
      // Show a SnackBar for unregistered routes
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Page $pageName not found')),
      );
    }
  }

  void _toggleTheme(BuildContext context) {
    // Add logic to toggle between light and dark themes
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Theme toggled')),
    );
  }
}
