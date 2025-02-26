import 'package:flutter/material.dart';
import 'view_schedules_screen.dart';
import 'view_alerts_screen.dart';
import 'view_profile_screen.dart';
import 'view_faculty_hours_screen.dart';
import 'view_emergency_contacts_screen.dart';

class StudentHomeScreen extends StatefulWidget {
  final String studentName;

  StudentHomeScreen({required this.studentName});

  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  List<String> schedules = [];
  List<String> alerts = [];
  String email = "michael.cabot@example.com";
  String course = "Computer Science";
  String studentId = "2022300191";
  String profilePhoto = "assets/profile_photo.png"; // Placeholder for profile photo

  void _navigateToViewSchedules() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewSchedulesScreen(
          schedules: schedules,
          onScheduleUpdated: (updatedSchedules) {
            setState(() {
              schedules = updatedSchedules;
            });
          },
        ),
      ),
    );
  }

  void _navigateToViewAlerts() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewAlertsScreen(alerts: alerts),
      ),
    );
  }

  void _navigateToViewProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewProfileScreen(
          studentName: widget.studentName,
          studentId: studentId,
          email: email,
          course: course,
          profilePhoto: profilePhoto,
        ),
      ),
    );
  }

  void _navigateToViewFacultyHours() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewFacultyHoursScreen(),
      ),
    );
  }

  void _navigateToViewEmergencyContacts() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewEmergencyContactsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${widget.studentName}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.cyan.shade600,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('View and Edit Schedules', style: TextStyle(color: Colors.white)),
            onTap: _navigateToViewSchedules,
          ),
          ListTile(
            title: Text('View Alerts for Upcoming Classes/Exams', style: TextStyle(color: Colors.white)),
            onTap: _navigateToViewAlerts,
          ),
          ListTile(
            title: Text('Access Personal Student Profile', style: TextStyle(color: Colors.white)),
            onTap: _navigateToViewProfile,
          ),
          ListTile(
            title: Text('View Faculty Office Hours', style: TextStyle(color: Colors.white)),
            onTap: _navigateToViewFacultyHours,
          ),
          ListTile(
            title: Text('Quick Access Emergency Contacts', style: TextStyle(color: Colors.white)),
            onTap: _navigateToViewEmergencyContacts,
          ),
        ],
      ),
    );
  }
}