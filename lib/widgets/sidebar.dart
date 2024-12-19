import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final Function(String) onItemSelected;

  const Sidebar({
    Key? key,
    required this.onItemSelected,
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
            onTap: () => _handleItemClick(context, "Dashboard"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.folder_open,
            title: "Projects",
            onTap: () => _handleItemClick(context, "Projects"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.work_outline,
            title: "Your Works",
            onTap: () => _handleItemClick(context, "Your Works"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.group,
            title: "Community",
            onTap: () => _handleItemClick(context, "Community"),
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
            onTap: () => _handleItemClick(context, "Nepali Team"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.add,
            title: "New Team",
            onTap: () => _handleItemClick(context, "New Team"),
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
            onTap: () => _handleItemClick(context, "Settings"),
          ),
          Spacer(), // Push the bottom options to the bottom
          // Bottom Options
          _buildSidebarItem(
            context,
            icon: Icons.wb_sunny,
            title: "Light Mode",
            onTap: () => _handleItemClick(context, "Light Mode"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.logout,
            title: "Logout",
            onTap: () => _handleItemClick(context, "Logout"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(BuildContext context,
      {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.white70,
        ),
      ),
      onTap: onTap,
    );
  }

  void _handleItemClick(BuildContext context, String itemName) {
    // Action triggered when any button is pressed
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$itemName clicked!'),
        duration: Duration(seconds: 2),
      ),
    );
    onItemSelected(itemName); // Call the callback to handle item selection
  }
}
