import 'package:flutter/material.dart';
import 'package:student_nav_system/main/custom_page_route.dart';
import 'view_schedules_screen.dart';
import 'view_help_screen.dart';
import 'view_profile_screen.dart';
import 'view_faculty_hours_screen.dart';
import 'view_emergency_contacts_screen.dart';
import 'login_screen.dart';
import 'campus_map_screen.dart';

class StudentHomeScreen extends StatefulWidget {
  final String studentName;

  StudentHomeScreen({required this.studentName});

  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  List<String> schedules = [];
  List<String> alerts = [];
  String email = "michaelandres0604@gmail.com";
  String course = "Computer Science";
  String studentId = "2022300191";
  String profilePhoto = "assets/sample-user.png"; // Placeholder for profile photo

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('Log out from account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CustomPageRoute(page: LoginScreen()),
                );
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${widget.studentName}', style: TextStyle(fontSize: 17, fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _confirmLogout, // Show confirmation dialog on logout
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors:  [
              Color(0xFFFF971A),
              Color(0xFFFFFF67),
            ],
            transform: GradientRotation(24)
            )
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
      decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage('assets/intro-background.png'),
      fit: BoxFit.cover,
    ),
    ),
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: [
          _buildGridButton(context, 'View Schedules', Icons.schedule, ViewSchedulesScreen(schedules: schedules, onScheduleUpdated: (updatedSchedules) {
            setState(() {
              schedules = updatedSchedules;
            });
          })),
          _buildGridButton(context, 'Help', Icons.help, ViewHelpScreen()),
          _buildGridButton(context, 'Profile', Icons.person, ViewProfileScreen(
            studentName: widget.studentName,
            studentId: studentId,
            email: email,
            course: course,
            profilePhoto: profilePhoto,
          )),
          _buildGridButton(context, 'Faculty Hours', Icons.access_time, ViewFacultyHoursScreen()),
          _buildGridButton(context, 'Emergency Contacts', Icons.security, ViewEmergencyContactsScreen()),
          _buildGridButton(context, 'Campus Map', Icons.map, CampusMapScreen()), // Replace null with the actual screen
        ],
      ),
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String title, IconData icon, Widget? navigateTo) {
    return GestureDetector(
      onTap: () {
        if (navigateTo != null) {
          Navigator.push(
            context,
            CustomPageRoute(page: navigateTo),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color(0xFF0C4B77),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontFamily: 'Montserrat', color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold), // Change the font size here
            ),
          ],
        ),
      ),
    );
  }
}
