import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    required this.userId,
    super.key,
  });

  final String? userId;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainAppBackgroundContainer(
        child: Center(
          child: Text('Calendar'),
        ),
      ),
    );
  }
}
