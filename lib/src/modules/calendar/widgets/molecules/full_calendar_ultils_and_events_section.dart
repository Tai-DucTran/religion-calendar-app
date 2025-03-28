import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

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
          loading: () => const Offstage(),
          error: (error, stackTrace) => const Offstage(),
          data: (events) {
            final selectedDate = ref.watch(selectedDateProvider);
            List<BasedEvent> listOfEvents = events.where((event) {
              return event.startDate.year == selectedDate.year &&
                  event.startDate.month == selectedDate.month &&
                  event.startDate.day == selectedDate.day;
            }).toList();

            if (listOfEvents.isEmpty) {
              return Text(context.l10n.emptyEventText);
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
