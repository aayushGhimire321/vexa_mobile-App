import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  final List<Map<String, String>> faqData = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF060B27), // Dark blue background
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0),
        child: Column(
          children: [
            // FAQ Title
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Correct placement of the textAlign property
              ),

      ),
            ),
            // FAQ List
            Expanded(
              child: ListView.builder(
                itemCount: faqData.length,
                itemBuilder: (context, index) {
                  final faq = faqData[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: FaqItem(
                      question: faq['question']!,
                      answer: faq['answer']!,
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

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(bottom: BorderSide(color: Colors.white24, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question
          Text(
            question,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Answer
          SizedBox(height: 10),
          Text(
            answer,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

