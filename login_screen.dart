import 'package:flutter/material.dart';
import 'student_home_screen.dart';
import 'guest_home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String validStudentId = '2022300191';
  final String validStudentName = 'Michael Andres Cabot';

  void _login() {
    String studentId = _idController.text;
    String password = _passwordController.text;

    if (studentId == validStudentId && studentId == password) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentHomeScreen(studentName: validStudentName),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Student ID/Password does not match')),
      );
    }
  }

  void _loginAsGuest() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GuestHomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trailfinder Login', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.cyan.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('A navigation app for the University of', style: TextStyle(fontSize: 12, color: Colors.cyan.shade600)),
            Text('Science and Technology of Southern Philippines', style: TextStyle(fontSize: 12, color: Colors.cyan.shade600)),
            SizedBox(height: 25),
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: 'Enter Student ID',
                labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              style: TextStyle(fontSize: 15, color: Colors.white),
              cursorColor: Colors.white,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 15, color : Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              style: TextStyle(fontSize: 15, color: Colors.white),
              cursorColor: Colors.white,
              obscureText: true,
            ),
            Text('If not Student, Enter as Guest', style: TextStyle(fontSize: 13, color: Colors.white)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login as Student', style: TextStyle(fontSize: 13, color: Colors.black)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _loginAsGuest,
              child: Text('Guest', style: TextStyle(fontSize: 13, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}