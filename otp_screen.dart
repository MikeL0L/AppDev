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
  bool isLoadingConfirm = false; // added loading function 3-17-25
  bool isLoadingResend = false;

  void handleConfirm() async {
    if (otpCode.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter the full OTP")),
      );
      return;
    }

    setState(() {
      isLoadingConfirm = true;
    });

    await Future.delayed(Duration(seconds: 2)); // Simulating OTP verification

    setState(() {
      isLoadingConfirm = false;
    });

    if (otpCode == hardcodedOtp) {
      Navigator.pushReplacement(
        context,
        CustomPageRoute(
          page: StudentHomeScreen(studentName: "Michael Andres Cabot"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  void handleResend() async {
    setState(() {
      isLoadingResend = true;
    });

    await Future.delayed(Duration(seconds: 2)); // Simulating OTP resend

    setState(() {
      isLoadingResend = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("OTP Resent Successfully!")),
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
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors:  [
                Color(0xFFFF971A),
                Color(0xFFFFFF67),
              ],
                  transform: GradientRotation(14)
              ),
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
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Colors.black,
                  focusedBorderColor: Colors.black,
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
                  onPressed: isLoadingConfirm ? null : handleConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: isLoadingConfirm
                      ? CircularProgressIndicator(color: Colors.black)
                      : Text(
                    "Confirm Code",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: isLoadingResend ? null : handleResend,
                  child: isLoadingResend
                      ? CircularProgressIndicator(color: Color(0xFF0C4B77))
                      : Text(
                    "Resend Code",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Color(0xFF0C4B77),
                    ),
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
