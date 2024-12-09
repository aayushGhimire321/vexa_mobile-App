import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Components/Features.dart';
import 'Components/Footer.dart';
import 'Components/benifits.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool signInOpen = false;
  bool signUpOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF13111C),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0x33CC00BB),
                    Color(0x00C920B8),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Navbar(setSignInOpen: (bool open) {
                    setState(() {
                      signInOpen = open;
                    });
                  }),
                  Hero(setSignInOpen: (bool open) {
                    setState(() {
                      signInOpen = open;
                    });
                  }),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Features(),
                  // Testimonials(), // Uncomment if needed
                  Benefits(),
                  Team(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Footer(),
                  ),
                ],
              ),
            ),
            if (signUpOpen)
              SignUp(
                setSignUpOpen: (bool open) {
                  setState(() {
                    signUpOpen = open;
                  });
                },
                setSignInOpen: (bool open) {
                  setState(() {
                    signInOpen = open;
                  });
                },
              ),
            if (signInOpen)
              SignIn(
                setSignInOpen: (bool open) {
                  setState(() {
                    signInOpen = open;
                  });
                },
                setSignUpOpen: (bool open) {
                  setState(() {
                    signUpOpen = open;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
