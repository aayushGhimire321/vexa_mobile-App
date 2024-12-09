import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';  // Import the font_awesome_flutter package

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'VEXA',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 16),
          // Navigation Links
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FooterNavLink(text: 'Home'),
                FooterNavLink(text: 'Features'),
                FooterNavLink(text: 'Benefits'),
                FooterNavLink(text: 'Team'),
              ],
            ),
          ),
          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaIcon(icon: FontAwesomeIcons.facebook, onTap: () {}),
              SocialMediaIcon(icon: FontAwesomeIcons.twitter, onTap: () {}),
              SocialMediaIcon(icon: FontAwesomeIcons.linkedin, onTap: () {}),
              SocialMediaIcon(icon: FontAwesomeIcons.instagram, onTap: () {}),
            ],
          ),
          // Copyright Text
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              '© 2023 Vexa. All rights reserved.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FooterNavLink extends StatelessWidget {
  final String text;

  FooterNavLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  SocialMediaIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        // You can animate icon scale or opacity on hover
      },
      onExit: (_) {
        // Reset animations when the mouse exits
      },
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedScale(
          duration: Duration(milliseconds: 200),
          scale: 1.2, // Scale on hover (You can adjust this)
          child: Icon(
            icon,
            size: 30,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }
}
