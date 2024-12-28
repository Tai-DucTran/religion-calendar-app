import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class FullCalendarDaysInMonth extends ConsumerWidget {
  const FullCalendarDaysInMonth({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(fullCalendarControllerProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return PageView.builder(
          controller: pageController,
          onPageChanged:
              ref.read(fullCalendarControllerProvider.notifier).onPageChanged,
          itemBuilder: (context, index) {
            return SizedBox(
              child: CalendarMonthWithAllDays(),
            );
          },
        );
      },
    );
  }
}
