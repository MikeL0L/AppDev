import 'package:flutter/material.dart';

class ViewAlertsScreen extends StatelessWidget {
  final List<String> alerts;

  ViewAlertsScreen({required this.alerts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Alerts', style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', color: Colors.black)),
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
      ),
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/features-background.png'),
        fit: BoxFit.cover,
          ),
        ),
      child: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(alerts[index], style: TextStyle(color: Colors.black)),
          );
        },
      ),
        ),
    );
  }
}
