import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: MainAppBackgroundContainer(
          child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WeeklyCalendarSection(),
                Spacing.sp24,
                const CurrentDateCard(),
                const UpComingEventsSection(),
                const WordOfWisdomSection(),
              ],
            ),
          ]))
        ],
      )),
    );
  }
}
