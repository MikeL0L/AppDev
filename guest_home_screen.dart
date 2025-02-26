import 'package:flutter/material.dart';
import 'view_emergency_contacts_screen.dart';

class GuestHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, Guest'),
        backgroundColor: Colors.cyan.shade600,
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              'As a Guest, You have access to the map and directions.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text('Emergency Contacts', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewEmergencyContactsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}