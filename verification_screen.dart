import 'package:flutter/material.dart';
import 'package:student_nav_system/main/custom_page_route.dart';
import 'otp_screen.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final String validEmail = "michaelandres0604@gmail.com";
  bool isLoading = false;

  void _verifyEmail() async {
    String enteredEmail = _emailController.text.trim();

    if (enteredEmail.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter an email address')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2)); // Simulating network delay

    setState(() {
      isLoading = false;
    });

    if (enteredEmail == validEmail) {
      Navigator.pushReplacement(
        context,
        CustomPageRoute(page: OTPScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email not found. Please try again.')),
      );
    }
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please enter your email to verify your account',
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 15, color: Colors.black),
                cursorColor: Colors.black,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading ? null : _verifyEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.black)
                    : Text(
                  'Verify Email',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
