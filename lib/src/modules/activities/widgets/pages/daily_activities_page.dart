import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class DailyActivitiesPage extends StatefulWidget {
  const DailyActivitiesPage({
    required this.userId,
    super.key,
  });

  final String? userId;

  @override
  State<DailyActivitiesPage> createState() => _DailyActivitiesPageState();
}

class _DailyActivitiesPageState extends State<DailyActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainAppBackgroundContainer(
        child: Center(
          child: Text('Daily Activies'),
        ),
      ),
    );
  }
}
