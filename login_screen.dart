import 'package:flutter/material.dart';
import 'package:student_nav_system/main/custom_page_route.dart';
import 'guest_home_screen.dart';
import 'verification_screen.dart';

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
      Navigator.pushReplacement(
        context,
        CustomPageRoute(page: VerificationScreen()),
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
      CustomPageRoute(
        page: GuestHomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage('assets/login-background.png'),
      fit: BoxFit.cover,
          ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'TrailFinder',
                style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
                color: Color(0xFF1C1654),
                ),
            ),
            Text('A navigation app for the University of', style: TextStyle(fontSize: 12, fontFamily: 'Montserrat', color: Colors.black)),
            Text('Science and Technology of Southern Philippines', style: TextStyle(fontSize: 12, fontFamily: 'Montserrat', color: Colors.black)),
            SizedBox(height: 25),
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: 'Enter Student ID',
                labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              style: TextStyle(fontSize: 15, color: Colors.black),
              cursorColor: Colors.black,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 15, color : Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              style: TextStyle(fontSize: 15, color: Colors.black),
              cursorColor: Colors.black,
              obscureText: true,
            ),
            Text('If not Student, Enter as Guest', style: TextStyle(fontSize: 13, color: Colors.black)),
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
      ),
    );
  }
}
