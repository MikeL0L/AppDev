import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewProfileScreen extends StatefulWidget {
  final String studentName;
  final String studentId;
  final String email;
  final String course;
  final String profilePhoto;

  ViewProfileScreen({
    required this.studentName,
    required this.studentId,
    required this.email,
    required this.course,
    required this.profilePhoto,
  });

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Profile',
          style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF971A), Color(0xFFFFFF67)],
              transform: GradientRotation(24),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/features-background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(widget.profilePhoto),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 125,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(widget.studentName,
                  style: const TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
              Text(widget.studentId,
                  style: TextStyle(fontSize: 15, fontFamily: 'Montserrat', color: Colors.grey[600])),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _buildProfileItem(Icons.email, 'Email', widget.email),
                      _buildProfileItem(Icons.school, 'Course', widget.course),
                      _buildPhoneInputField(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: const TextStyle(fontSize: 16)),
      subtitle: Text(value, style: const TextStyle(fontSize: 14)),
    );
  }

  Widget _buildPhoneInputField() {
    return ListTile(
      leading: Icon(Icons.phone_android, color: Colors.black),
      title: const Text('Phone Number', style: TextStyle(fontSize: 16)),
      subtitle: TextField(
        controller: _phoneController,
        keyboardType: TextInputType.number,
        maxLength: 11,
        decoration: const InputDecoration(
          hintText: 'Enter phone number',
          counterText: '',
          border: InputBorder.none,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
