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
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: [
          _buildGridButton(context, 'Emergency #', Icons.security, ViewEmergencyContactsScreen()),
          _buildGridButton(context, 'Campus Map', Icons.map, null), // Replace null with the actual screen
          _buildGridButton(context, 'Help', Icons.help, null), // Replace null with the actual screen
        ],
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String title, IconData icon, Widget? navigateTo) {
    return GestureDetector(
      onTap: () {
        if (navigateTo != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateTo),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
