import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class FullCalendarDaysInMonth extends ConsumerWidget {
  const FullCalendarDaysInMonth({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });
  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markedDates = {
      DateTime(2024, 11, 5): AriesColor.danger100,
      DateTime(2024, 11, 10): Colors.blue,
      DateTime(2024, 11, 15): AriesColor.success100,
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        return PageView.builder(
          controller: controller,
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

            return Container(
              padding: EdgeInsets.only(
                right: 16.w,
                left: 16.w,
              ),
              height: constraints.maxHeight,
              child: _CalendarMonth(
                displayedMonth: month,
                daysInMonth: daysInMonth,
                hasFirstDayOfMonthOnWeekend: hasSixWeeksInMonth,
                firstWeekday: firstWeekday,
                markedDates: markedDates,
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
    required this.markedDates,
  });

  final DateTime displayedMonth;
  final int daysInMonth;
  final int firstWeekday;
  final bool hasFirstDayOfMonthOnWeekend;
  final Map<DateTime, Color> markedDates;

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
          final hasMarker = markedDates.containsKey(date);

          return FullCalendarDataCell(
            date: date,
            isSelected: isSelected,
            isToday: isToday,
            hasMarker: hasMarker,
            markerColor: markedDates[date],
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
