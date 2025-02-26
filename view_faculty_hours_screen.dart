import 'package:flutter/material.dart';

class ViewFacultyHoursScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty Office Hours'),
        backgroundColor: Colors.cyan.shade600,
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Dr. Smith: Mon-Fri, 10 AM - 12 PM', style: TextStyle(color: Colors.white))),
          ListTile(title: Text('Prof. Johnson: Tue-Thu, 1 PM - 3 PM ', style: TextStyle(color: Colors.white))),
          ListTile(title: Text('Ms. Lee: Wed, 2 PM - 4 PM', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}