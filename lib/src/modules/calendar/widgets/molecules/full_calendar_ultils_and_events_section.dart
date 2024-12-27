import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FullCalendarUltilsAndEventsSection extends ConsumerWidget {
  const FullCalendarUltilsAndEventsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _EventSectionContent();
  }
}

class _EventSectionContent extends ConsumerWidget {
  const _EventSectionContent();

  List<BasedEvent> sortEventsByPriority(List<BasedEvent> events) {
    events.sort((a, b) {
      if (a.eventCategory == EventCategory.religionEvent &&
          b.eventCategory != EventCategory.religionEvent) {
        return -1;
      }
      if (b.eventCategory == EventCategory.religionEvent &&
          a.eventCategory != EventCategory.religionEvent) {
        return 1;
      }

      if (a.eventCategory == EventCategory.specialEvent &&
          b.eventCategory != EventCategory.specialEvent) {
        return -1;
      }
      if (b.eventCategory == EventCategory.specialEvent &&
          a.eventCategory != EventCategory.specialEvent) {
        return 1;
      }

      return 0;
    });
    return events;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(combineEventsControllerProvider);

    return Column(
      children: [
        const FullCalendarUtilButtons(),
        Spacing.sp16,
        events.when(
          loading: () => Skeletonizer(
            effect: const ShimmerEffect(
              baseColor: AriesColor.neutral30,
            ),
            enableSwitchAnimation: true,
            child: FullCalendarEventCard(
              eventName: mockLoadingTextContent,
              eventTime: DateTime.now(),
              eventLocation: mockLoadingTextContent,
              eventCategory: EventCategory.businessEvent,
            ),
          ),
          error: (error, stackTrace) => const Offstage(),
          data: (events) {
            final selectedDate = ref.watch(selectedDateProvider);
            List<BasedEvent> listOfEvents = events.where((event) {
              return event.startDate.year == selectedDate.year &&
                  event.startDate.month == selectedDate.month &&
                  event.startDate.day == selectedDate.day;
            }).toList();

            if (listOfEvents.isEmpty) {
              return Text(LocalizedKeys.emptyEventText);
            }
            listOfEvents = sortEventsByPriority(listOfEvents);

            return Column(
              children: listOfEvents.map(
                (event) {
                  return GestureDetector(
                    onTap: () async {
                      final result = await ViewEventModalBottomSheet.show(
                        context,
                        event: event,
                      );
                      if (!result) return;
                    },
                    child: FullCalendarEventCard(
                      eventName: event.title,
                      eventTime: event.isAllDay ? null : event.startDate,
                      eventLocation: event.location,
                      eventCategory: event.eventCategory,
                    ),
                  );
                },
              ).toList(),
            );
          },
        ),
      ],
    );
  }
}
