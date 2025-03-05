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
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: [
          _buildGridButton(context, 'View Schedules', Icons.schedule, ViewSchedulesScreen(schedules: schedules, onScheduleUpdated: (updatedSchedules) {
            setState(() {
              schedules = updatedSchedules;
            });
          })),
          _buildGridButton(context, 'View Alerts', Icons.notifications, ViewAlertsScreen(alerts: alerts)),
          _buildGridButton(context, 'Profile', Icons.person, ViewProfileScreen(
            studentName: widget.studentName,
            studentId: studentId,
            email: email,
            course: course,
            profilePhoto: profilePhoto,
          )),
          _buildGridButton(context, 'Faculty Hours', Icons.access_time, ViewFacultyHoursScreen()),
          _buildGridButton(context, 'Emergency #', Icons.security, ViewEmergencyContactsScreen()),
          _buildGridButton(context, 'Campus Map', Icons.map, null), // Replace null with the actual screen
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
