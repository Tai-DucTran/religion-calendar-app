import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

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
          events.when(
            loading: () => DefaultSkeleton(
              child: EventCard(
                eventName: mockLoadingTextContent,
                eventDate: DateTime.now(),
                eventTime: mockLoadingTextContent,
                eventCategory: EventCategory.businessEvent,
                eventLocation: mockLoadingTextContent,
                isLoading: true,
              ),
            ),
            error: (error, stackTrace) => const Offstage(),
            data: (events) {
              if (events.isEmpty) {
                return Text(context.l10n.emptyEventText);
              }

              final displayedEvents = getUpcomingEvents(events);

              return Column(
                children: displayedEvents.map(
                  (event) {
                    final eventTime = DateFormat(DateTimeFormat.hourMinute)
                        .format(event.startDate);

                    return GestureDetector(
                      onTap: () async {
                        final result = await ViewEventModalBottomSheet.show(
                          context,
                          event: event,
                        );
                        if (!result) return;
                      },
                      child: EventCard(
                        eventName: event.title,
                        eventDate: event.startDate,
                        eventTime: eventTime,
                        eventCategory: event.eventCategory,
                        eventLocation: event.location,
                      ),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
