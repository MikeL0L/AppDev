import 'package:flutter/material.dart';
import 'package:student_nav_system/main/custom_page_route.dart';
import 'add_schedule_screen.dart';

class ViewSchedulesScreen extends StatefulWidget {
  final List<String> schedules;
  final Function(List<String>) onScheduleUpdated;

  ViewSchedulesScreen({required this.schedules, required this.onScheduleUpdated});

  @override
  _ViewSchedulesScreenState createState() => _ViewSchedulesScreenState();
}

class _ViewSchedulesScreenState extends State<ViewSchedulesScreen> {
  final List<String> daysOfWeek = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];

  Map<String, List<String>> _groupSchedulesByDay(List<String> schedules) {
    Map<String, List<String>> dayMap = {
      for (var day in daysOfWeek) day: []
    };
    for (var schedule in schedules) {
      for (var day in daysOfWeek) {
        if (schedule.startsWith(day)) {
          dayMap[day]?.add(schedule);
        }
      }
    }
    return dayMap;
  }

  @override
  Widget build(BuildContext context) {
    final daySchedules = _groupSchedulesByDay(widget.schedules);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Schedules', style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', color: Colors.black)),
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                CustomPageRoute(
                  page: AddScheduleScreen(
                    onScheduleAdded: (newSchedules) {
                      setState(() {
                        widget.schedules.addAll(newSchedules);
                        widget.onScheduleUpdated(widget.schedules);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/features-background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: daysOfWeek.length,
          itemBuilder: (context, index) {
            final day = daysOfWeek[index];
            final schedules = daySchedules[day] ?? [];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                  if (schedules.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 10),
                      child: Text(
                        "add a schedule for this day",
                        style: TextStyle(color: Colors.black.withOpacity(0.4), fontStyle: FontStyle.italic),
                      ),
                    )
                  else
                    ...schedules.map((schedule) {
                      final parts = schedule.split(" - ");
                      final course = parts.length > 1 ? parts[1] : "Unknown";
                      final time = parts.length > 3 ? "${parts[2]}–${parts[3]}" : "";
                      final room = parts.length > 4 ? parts[4] : "";
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 4),
                        child: Text("• $course - $time - $room", style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
                      );
                    }).toList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
