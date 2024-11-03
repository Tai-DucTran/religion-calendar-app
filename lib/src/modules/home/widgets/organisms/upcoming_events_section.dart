import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';

class UpComingEventsSection extends ConsumerWidget {
  const UpComingEventsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(combineEventsControllerProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const UpComingEventsHeader(),
          events.maybeWhen(
            loading: () => const CircularProgressIndicator(),
            error: (error, stacktrace) => Text('Error: $error'),
            orElse: () => const Offstage(),
            data: (listOfEvents) {
              if (listOfEvents.isEmpty) {
                return const Text('There are no events');
              }
              final displayedEvents =
                  listOfEvents.take(maxEventsHomePage).toList();

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
