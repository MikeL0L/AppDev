import 'package:flutter/material.dart';
import 'title_screen.dart';

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
        scaffoldBackgroundColor: Colors.white,
      ),
      home: TitleScreen(), // Set TitleScreen as the home
    );
  }
}
