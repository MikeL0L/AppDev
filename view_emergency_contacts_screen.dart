import 'package:flutter/material.dart';

class ViewEmergencyContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
        backgroundColor: Colors.cyan.shade600,
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Campus Security: 123-456-7890', style: TextStyle(color: Colors.white))),
          ListTile(title: Text('Health Services: 987-654-3210', style: TextStyle(color: Colors.white))),
          ListTile(title: Text('Counseling Center: 555-555-5555', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}