import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final Function(bool) setSignInOpen;

  Navbar({required this.setSignInOpen});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            'VEXA',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Theme.of(context).primaryColor, // Primary color from theme
            ),
          ),
          // Menu Items
          Row(
            children: [
              // Menu items
              _buildMenuItem('Home', context),
              _buildMenuItem('Features', context),
              _buildMenuItem('Benefits', context),
              _buildMenuItem('Team', context),
            ],
          ),
          // Sign In Button
          TextButton.icon(
            onPressed: () => setSignInOpen(true),
            icon: Icon(
              Icons.account_circle_outlined,
              color: Theme.of(context).primaryColor, // Primary color from theme
            ),
            label: Text(
              'Sign In',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
              side: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String label, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(0, 0),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).textTheme.bodyLarge?.color, // Text color from theme
          ),
        ),
      ),
    );
  }
}
