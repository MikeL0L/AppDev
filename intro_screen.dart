import 'package:flutter/material.dart';
import 'login_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _skipToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _proceedToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          _buildPage(
            title: "Navigate Your Campus Like a Pro",
            description: "Find buildings, lecture halls, and student services in just a tap.",
            showSkipButton: true,
          ),
          _buildPage(
            title: "Find Your Campus Effortlessly",
            description: "Navigate your university with ease and confidence.",
            showSkipButton: true,
          ),
          _buildPage(
            title: "Your Academic Journey, Simplified!",
            description: "Explore classrooms, libraries, and facilities with precision and convenience.",
            showSkipButton: false,
            isLastPage: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPage({required String title, required String description, bool showSkipButton = false, bool isLastPage = false}) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(16.0),
      child: Center( // Center the content both horizontally and vertically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40), // Add space between text and buttons
            if (showSkipButton)
              TextButton(
                onPressed: _skipToLogin,
                child: Text("Skip", style: TextStyle(fontSize: 20, color: Colors.cyan)),
              ),
            if (isLastPage)
              ElevatedButton(
                onPressed: _proceedToLogin,
                child: Text("Proceed to Login", style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
          ],
        ),
      ),
    );
  }
}