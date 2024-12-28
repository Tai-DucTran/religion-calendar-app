import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';
import 'package:religion_calendar_app/src/router/routes.dart';

class WeeklyCalendarSection extends ConsumerWidget {
  const WeeklyCalendarSection({super.key});

  String getGreetingText() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return LocalizedKeys.goodMorningText;
    } else if (hour >= 12 && hour < 18) {
      return LocalizedKeys.goodAfternoonText;
    } else {
      return LocalizedKeys.goodEveningText;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(combineEventsControllerProvider);
    final currentWeekDates = ref.watch(getCurrentWeekProvider);
    final Map<DateTime, List<Color>> markedCurrentWeekDates = {};

    events.whenData((eventsList) {
      for (var date in currentWeekDates) {
        final normalizedDate = DateTime(date.year, date.month, date.day);
        markedCurrentWeekDates[normalizedDate] = [];
      }

      for (var event in eventsList) {
        final eventDate = DateTime(
            event.startDate.year, event.startDate.month, event.startDate.day);

        final eventType = event.eventCategory;

        if (markedCurrentWeekDates.containsKey(eventDate)) {
          final color = switch (eventType) {
            EventCategory.religionEvent => AriesColor.yellowP300,
            EventCategory.specialEvent => AriesColor.success200,
            _ => const Color(0xFF6F66FF)
          };

          final eventColors = markedCurrentWeekDates[eventDate];

          int getColorPriority(Color color) {
            if (color == AriesColor.yellowP300) return 0;
            if (color == AriesColor.success200) return 1;
            if (color == const Color(0xFF6F66FF)) return 2;
            return 3;
          }

          if (eventColors != null && !eventColors.contains(color)) {
            eventColors.add(color);
            eventColors.sort(
                (a, b) => getColorPriority(a).compareTo(getColorPriority(b)));
          }
        }
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getGreetingText(),
              style: AriesTextStyles.textHeading4,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              onPressed: () async {
                ref.read(displayedMonthProvider.notifier).state =
                    DateTime.now();
                context.push(
                  FullCalendarRoute().location,
                );
              },
              child: Text(
                LocalizedKeys.watchFullCalendarText,
                style: AriesTextStyles.textBodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AriesColor.yellowP950,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.sp),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Wrap(
            children: currentWeekDates.map((date) {
              final normalizedDate = DateTime(date.year, date.month, date.day);
              final listMarkerColor =
                  markedCurrentWeekDates[normalizedDate] ?? [];

              return DateSection(
                inputDate: date,
                isToday: isDateToday(date),
                isNotInCurrentMonth: !isDateInCurrentMonth(date),
                listMarkerColor: listMarkerColor,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
