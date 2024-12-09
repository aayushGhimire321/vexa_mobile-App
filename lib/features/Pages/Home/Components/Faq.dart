import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FAQ data
    final faqData = [
      {
        'question': 'Is my data secure?',
        'answer': 'Yes, we take security very seriously and use the latest encryption technology to protect your data.',
      },
      {
        'question': 'How much does the app cost?',
        'answer': 'Our app has a variety of pricing plans to fit any budget, starting at just \$9.99/month.',
      },
      {
        'question': 'What kind of support is available?',
        'answer': 'We offer 24/7 support via email and live chat to ensure you get the help you need.',
      },
    ];

    return Scaffold(
      backgroundColor: Color(0xFF060B27), // Dark background
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FAQ Title
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Aligning the text to the center
            ),
            SizedBox(height: 40), // Space between title and list

            // FAQ List
            Expanded(
              child: ListView.builder(
                itemCount: faqData.length,
                itemBuilder: (context, index) {
                  final faq = faqData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      color: Colors.transparent, // Transparent background
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Question
                          Text(
                            faq['question']!,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Answer
                          Text(
                            faq['answer']!,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70, // Slightly lighter white for answer
                            ),
                          ),
                        ],
                      ),
                    ),
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


