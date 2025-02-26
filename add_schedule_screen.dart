import 'package:flutter/material.dart';

class AddScheduleScreen extends StatefulWidget {
  final Function(String) onScheduleAdded;
  final String? existingSchedule;

  AddScheduleScreen({required this.onScheduleAdded, this.existingSchedule});

  @override
  _AddScheduleScreenState createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends State<AddScheduleScreen> {
  late TextEditingController _scheduleController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with existing schedule if provided
    _scheduleController = TextEditingController(text: widget.existingSchedule);
  }

  @override
  void dispose() {
    _scheduleController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingSchedule == null ? 'Add Schedule' : 'Edit Schedule'),
        backgroundColor: Colors.cyan.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _scheduleController,
              decoration: InputDecoration(
                labelText: 'Enter your schedule',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String schedule = _scheduleController.text;
                if (schedule.isNotEmpty) {
                  widget.onScheduleAdded(schedule); // Call the callback to add/update the schedule
                  Navigator.pop(context); // Go back to the previous screen
                } else {
                  // Show a message if the input is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a schedule')),
                  );
                }
              },
              child: Text(widget.existingSchedule == null ? 'Add Schedule' : 'Update Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}