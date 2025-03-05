import 'package:flutter/material.dart';
import 'intro_screen.dart';

void main() {
  runApp(CampusNavigatorApp());
}

class CampusNavigatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: IntroScreen(), // Set IntroScreen as the home
    );
  }
}
