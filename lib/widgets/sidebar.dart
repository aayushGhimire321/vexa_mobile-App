import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF1E1E1E),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF121212),
            ),
            child: Row(
              children: [
                Icon(Icons.menu, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'VEXA',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildSidebarItem(Icons.dashboard, "Dashboard"),
          _buildSidebarItem(Icons.work_outline, "Projects"),
          _buildSidebarItem(Icons.assignment, "Your Works"),
          _buildSidebarItem(Icons.people, "Community"),
          Divider(color: Colors.grey),
          _buildSidebarSection("Teams"),
          _buildSidebarItem(Icons.flag, "Nepali"),
          _buildSidebarItem(Icons.add, "New Team"),
          Divider(color: Colors.grey),
          _buildSidebarItem(Icons.light_mode, "Light Mode"),
          _buildSidebarItem(Icons.logout, "Logout"),
        ],
      ),
    );
  }

  Widget _buildSidebarSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {
        // Handle navigation
      },
    );
  }
}
