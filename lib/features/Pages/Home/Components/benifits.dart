import 'package:flutter/material.dart';

class Feature {
  final IconData icon;
  final String title;
  final String description;

  Feature({required this.icon, required this.title, required this.description});
}

class Benefits extends StatelessWidget {
  // List of features
  final List<Feature> featuresData = [
    Feature(
      icon: Icons.trending_up,
      title: 'Increased Productivity',
      description:
      'Effortlessly manage your personal projects and assign tasks to team members while keeping track of progress.',
    ),
    Feature(
      icon: Icons.forum,
      title: 'Improved Communication',
      description:
      'Keep everyone on the same page and reduce misunderstandings with clear communication.',
    ),
    Feature(
      icon: Icons.check_circle_outline,
      title: 'Better Project Outcomes',
      description:
      'Make informed decisions and track progress to ensure successful project outcomes.',
    ),
    Feature(
      icon: Icons.diversity_3,
      title: 'Networking Opportunities',
      description:
      'Connect and collaborate with other developers and professionals in your industry to expand your network and build valuable relationships.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181622),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 150.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xFF854CE6),
                child: Text(
                  '2',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              'Benefits',
              style: TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.bold,
                color: Color(0xFF854CE6),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Discover the many benefits of using our app to manage your personal and team projects.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB4B4B4),
                // maxLines: 2,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemCount: featuresData.length,
                itemBuilder: (context, index) {
                  final feature = featuresData[index];
                  return FeatureCard(
                    icon: feature.icon,
                    title: feature.title,
                    description: feature.description,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Color(0xFF1E1E2F),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF854CE6),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                color: Color(0xFFB4B4B4),
                fontSize: 16,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Color(0xFF854CE6),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


