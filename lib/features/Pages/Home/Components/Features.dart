import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  final List<Map<String, dynamic>> featuresData = [
    {
      'icon': Icons.flash_on,
      'title': 'Project Management',
      'description':
      'Effortlessly manage your personal projects and assign tasks to team members while keeping track of progress.',
    },
    {
      'icon': Icons.group,
      'title': 'Team Collaboration',
      'description':
      'Collaborate with your team members in real-time, assign tasks, and keep track of your team’s progress.',
    },
    {
      'icon': Icons.public,
      'title': 'Community Building',
      'description':
      'Connect with members of similar interests, build communities, and grow your network.',
    },
    {
      'icon': Icons.timeline,
      'title': 'Time Tracking',
      'description':
      'Track your time and improve your productivity by setting goals and keeping track of your progress.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 200),
        margin: EdgeInsets.only(top: -80),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x17E3A1E6),
              Color(0x00000000),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFF306EE8), width: 6),
                color: Color(0x16306EE8),
              ),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Color(0xFF306EE8),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Key Features',
              style: TextStyle(
                color: Color(0xFF306EE8),
                fontSize: 52,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Discover how our app simplifies project management and makes collaboration effortless.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFBEC2D1),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 40),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 1.2,
              ),
              itemCount: featuresData.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 350,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Color(0xFF1E1D2B),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xFF306EE8), width: 0.1),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF306EE8).withOpacity(0.15),
                        offset: Offset(0, 4),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              featuresData[index]['title'],
                              style: TextStyle(
                                color: Color(0xFFB4B9C6),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              featuresData[index]['description'],
                              style: TextStyle(
                                color: Color(0xFFBEC2D1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFF306EE8),
                          child: Icon(
                            featuresData[index]['icon'],
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

