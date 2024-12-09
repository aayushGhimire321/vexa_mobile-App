import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final Function(bool) setSignInOpen;

  HeroSection({required this.setSignInOpen});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Power Your Projects with Our App.',
                  style: TextStyle(
                    fontSize: 58,
                    fontWeight: FontWeight.w800,
                    color: Colors.black, // Use your theme text color here
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Take control of your projects and stay on top of your goals with our intuitive project management app. Say goodbye to chaos and hello to streamlined efficiency. Try it now and experience the difference.',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey, // Use your theme soft color here
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    setSignInOpen(true);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 50), // Button width
                    backgroundColor: Colors.transparent, // Gradient will be applied here
                  ).copyWith(
                    backgroundColor: MaterialStateProperty.all(
                      const LinearGradient(
                        colors: [Color(0xFF801AE6), Color(0xFFA21AE6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(Rect.fromLTWH(0, 0, 200, 70)) as Color?, // Gradient background
                    ),
                  ),
                  child: Text(
                    'Manage a New Project',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Right Section: Image
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/Header.png', // Update with your asset path
              width: 500,
              height: 500,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
