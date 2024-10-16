import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/user_event_controller.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';

class UpComingEventsSection extends ConsumerWidget {
  const UpComingEventsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userEvents = ref.watch(userEventControllerProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const UpComingEventsHeader(),
          userEvents.maybeWhen(
            loading: () => const CircularProgressIndicator(),
            error: (error, stacktrace) => Text('Error: $error'),
            orElse: () => const Offstage(),
            data: (listOfUserEvent) {
              if (listOfUserEvent.isEmpty) {
                return const Text('There are no events');
              }
              final now = DateTime.now();
              final sortedEvents = listOfUserEvent
                  .where((event) => event.startDate.isAfter(now))
                  .toList()
                ..sort(
                  (a, b) => a.startDate.compareTo(b.startDate),
                );
              final displayedEvents =
                  sortedEvents.take(maxEventsHomePage).toList();

              return Column(
                children: [
                  ...displayedEvents.map(
                    (event) {
                      return EventCard(
                        eventName: event.title,
                        eventDate: event.startDate,
                        eventTime:
                            '${event.startDate.hour}:${event.startDate.minute}',
                        eventCategory: event.eventCategory,
                        eventLocation: event.location,
                        eventImageUrl: AriesImages.defaultFamilyEvent,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
