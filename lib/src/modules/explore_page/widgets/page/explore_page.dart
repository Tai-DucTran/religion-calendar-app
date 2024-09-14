import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    required this.userId,
    super.key,
  });

  final String? userId;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainAppBackgroundContainer(
        child: Center(
          child: Text('Explore Page'),
        ),
      ),
    );
  }
}
