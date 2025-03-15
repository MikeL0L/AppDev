import 'package:flutter/material.dart';
import 'package:student_nav_system/main/custom_page_route.dart';
import 'student_home_screen.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String otpCode = "";
  final String hardcodedOtp = "123456";

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
      child: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.yellow[200],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.verified_outlined, size: 50, color: Colors.green),
              SizedBox(height: 20),
              Text(
                "Verification Code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Enter the 6-digit code sent to your email",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 20),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xFFFF971A),
                focusedBorderColor: Color(0xFFFFFF67),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  setState(() {
                    otpCode = verificationCode;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle OTP submission
                  print("Entered OTP: $otpCode");
                  // Navigate to Student Home Screen after successful verification
                  if (otpCode == hardcodedOtp) {
                    Navigator.pushReplacement(
                      context,
                      CustomPageRoute(
                        page: StudentHomeScreen(
                            studentName: "Michael Andres Cabot"),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid OTP. Please try again.')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                    "Confirm Code",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle OTP resend
                },
                child: Text(
                  "Resend Code",
                  style: TextStyle(fontSize: 15, color: Color(0xFF0C4B77)),
                ),
              ),
            ],
          ),
        ),
      ),
        ),
    );
  }
}
