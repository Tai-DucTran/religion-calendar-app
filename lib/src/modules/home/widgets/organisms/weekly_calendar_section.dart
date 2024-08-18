import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';

class WeeklyCalendarSection extends ConsumerWidget {
  const WeeklyCalendarSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeekDates = ref.watch(getCurrentWeekProvider);
    final currentMonthText = ref.watch(getCurrentMonthProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentMonthText,
              style: AriesTextStyles.textHeading5,
            ),
            Spacing.sp8,
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: currentWeekDates.map(
            (date) {
              return DateSection(
                inputDate: date,
                isToday: isDateToday(date),
                isNotInCurrentMonth: !isDateInCurrentMonth(date),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
