import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class FullCalendarDaysInMonth extends ConsumerWidget {
  const FullCalendarDaysInMonth({
    super.key,
    required this.onPageChanged,
  });

  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(fullCalendarControllerProvider);
    final events = ref.watch(combineEventsControllerProvider);
    final Map<DateTime, List<Color>> markedDates = {};

    events.whenData((eventsList) {
      for (var date in eventsList) {
        final normalizedDate = DateTime(
            date.startDate.year, date.startDate.month, date.startDate.day);
        markedDates[normalizedDate] = [];
      }

      for (var event in eventsList) {
        final eventDate = DateTime(
            event.startDate.year, event.startDate.month, event.startDate.day);

        final eventType = event.eventCategory;

        if (markedDates.containsKey(eventDate)) {
          final color = switch (eventType) {
            EventCategory.religionEvent => AriesColor.yellowP300,
            EventCategory.specialEvent => AriesColor.success200,
            _ => const Color(0xFF6F66FF)
          };

          final eventColors = markedDates[eventDate];

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

    return LayoutBuilder(
      builder: (context, constraints) {
        return PageView.builder(
          controller: pageController,
          onPageChanged: onPageChanged,
          itemBuilder: (context, index) {
            final monthDiff = index - 1000;
            final month = DateTime(
              DateTime.now().year,
              DateTime.now().month + monthDiff,
            );
            final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
            final firstDayOfMonth = DateTime(month.year, month.month, 1);
            final firstWeekday = firstDayOfMonth.weekday;
            final hasSixWeeksInMonth = isHasSixWeeksInMonth(month);
            final markedDatesInMonth = <DateTime, List<Color>>{};

            markedDates.forEach((date, colors) {
              if (date.year == month.year && date.month == month.month) {
                markedDatesInMonth[date] = colors;
              }
            });

            return SizedBox(
              height: constraints.maxHeight,
              child: _CalendarMonth(
                displayedMonth: month,
                daysInMonth: daysInMonth,
                hasFirstDayOfMonthOnWeekend: hasSixWeeksInMonth,
                firstWeekday: firstWeekday,
                markedDatesInMonth: markedDatesInMonth,
              ),
            );
          },
        );
      },
    );
  }
}

class _CalendarMonth extends ConsumerWidget {
  const _CalendarMonth({
    required this.displayedMonth,
    required this.daysInMonth,
    required this.hasFirstDayOfMonthOnWeekend,
    required this.firstWeekday,
    required this.markedDatesInMonth,
  });

  final DateTime displayedMonth;
  final int daysInMonth;
  final int firstWeekday;
  final bool hasFirstDayOfMonthOnWeekend;
  final Map<DateTime, List<Color>> markedDatesInMonth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);

    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 4,
          crossAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemCount: hasFirstDayOfMonthOnWeekend ? 42 : 35,
        itemBuilder: (context, index) {
          final dayOffset = index - (firstWeekday - 1);
          final day = dayOffset + 1;

          if (dayOffset < 0 || day > daysInMonth) {
            return const SizedBox.shrink();
          }

          final date = DateTime(displayedMonth.year, displayedMonth.month, day);
          final isSelected = date.year == selectedDate.year &&
              date.month == selectedDate.month &&
              date.day == selectedDate.day;
          final isToday = _isToday(date);
          final hasMarker = markedDatesInMonth.containsKey(date);

          return FullCalendarDataCell(
            date: date,
            isSelected: isSelected,
            isToday: isToday,
            hasMarker: hasMarker,
            listMarkerColor: markedDatesInMonth[date] ?? [],
            onTap: () {
              ref.read(selectedDateProvider.notifier).state = date;
            },
          );
        },
      );
    });
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
