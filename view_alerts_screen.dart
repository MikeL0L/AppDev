import 'package:flutter/material.dart';

class ViewAlertsScreen extends StatelessWidget {
  final List<String> alerts;

  ViewAlertsScreen({required this.alerts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts'),
        backgroundColor: Colors.cyan.shade600,
      ),
      body: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(alerts[index], style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}