import 'package:aries/aries.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback/controllers/feedback_controller.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFeedbackEnabled = ref.watch(feedbackControllerProvider);

    return Scaffold(
      body: MainAppBackgroundContainer(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WeeklyCalendarSection(),
                      const CurrentDateCard(),
                      const UpComingEventsSection(),
                      const WordOfWisdomSection(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (!isFeedbackEnabled) {
                ref.read(feedbackControllerProvider.notifier).toggleFeedback();
              }

              BetterFeedback.of(context).show((feedback) {
                ref.read(feedbackControllerProvider.notifier).toggleFeedback();
              });
            },
            shape: const CircleBorder(),
            backgroundColor: AriesColor.neutral800,
            elevation: 2,
            child: const Icon(
              Icons.bug_report,
              color: AriesColor.neutral0,
            ),
          ),
          FloatingActionButton(
            onPressed: () async {
              final result = await EventDetailModalBottomSheet.show(
                context,
              );
              if (!result) return;
            },
            shape: const CircleBorder(),
            backgroundColor: AriesColor.yellowP300,
            elevation: 2,
            child: const Icon(
              Icons.add,
              color: AriesColor.neutral0,
            ),
          ),
        ],
      ),
    );
  }
}
