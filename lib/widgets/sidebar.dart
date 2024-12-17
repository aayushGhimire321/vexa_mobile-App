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
            onTap: () => onItemSelected("Dashboard"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.folder_open,
            title: "Projects",
            onTap: () => onItemSelected("Projects"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.work_outline,
            title: "Your Works",
            onTap: () => onItemSelected("Your Works"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.group,
            title: "Community",
            onTap: () => onItemSelected("Community"),
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
            onTap: () => onItemSelected("Nepali Team"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.add,
            title: "New Team",
            onTap: () => onItemSelected("New Team"),
          ),
          Spacer(),
          // Bottom Options
          _buildSidebarItem(
            context,
            icon: Icons.wb_sunny,
            title: "Light Mode",
            onTap: () => onItemSelected("Light Mode"),
          ),
          _buildSidebarItem(
            context,
            icon: Icons.logout,
            title: "Logout",
            onTap: () => onItemSelected("Logout"),
          ),
          SizedBox(height: 20),
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
}
