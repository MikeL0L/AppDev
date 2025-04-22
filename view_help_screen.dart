import 'package:flutter/material.dart';

class ViewHelpScreen extends StatelessWidget {
  final List<String> helpTexts = [
    'Log in using your 10-digit Student ID as both username and password.',
    'Guests can use the app without logging in but will have limited features.',
    'Access the campus map and tap on buildings for more details.',
    'Students can drag and drop class schedules to customize their timetable.',
    'Receive alerts for upcoming classes and exams in the student dashboard.',
    'Tap on emergency contacts from the menu for quick access to help.',
    'Check your profile from the profile screen to see your personal information.',
    'Use the app’s search bar to locate classrooms, offices, and facilities.',
    'View faculty office hours directly from the class detail screen.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Instructions',
            style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF971A),
                    Color(0xFFFFFF67),
                  ],
                  transform: GradientRotation(24))),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/features-background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: helpTexts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('•', style: TextStyle(fontSize: 24, color: Colors.black)),
              title: Text(
                helpTexts[index],
                style: TextStyle(fontFamily: 'Montserrat',fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }
}
