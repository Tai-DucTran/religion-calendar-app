import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/geoip_and_locales/controllers/controllers.dart';

class FullCalendarSection extends ConsumerWidget {
  const FullCalendarSection({
    super.key,
    this.onDateSelected,
  });

  final Function(DateTime)? onDateSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeControllerProvider).languageCode;
    final pageController = ref.watch(fullCalendarControllerProvider);

    return Column(
      children: [
        FullMonthCalendarHeader(
          controller: pageController,
          currentLocale: currentLocale,
        ),
        Spacing.sp16,
        FullCalendarWeekdayHeader(
          currentLocale: currentLocale,
        ),
        Spacing.sp4,
        Expanded(
          child: FullCalendarDaysInMonth(
            controller: pageController,
            onPageChanged:
                ref.read(fullCalendarControllerProvider.notifier).onPageChanged,
          ),
        ),
        const FullCalendarUltilsAndEventsSection()
      ],
    );
  }
}

/// Features in this pages:
/// 1. Display full month calendar -> done
/// 1.1. including lunar calendar -> done
/// 1.2. including userEvents
/// 1.3. including religionEvents
/// 1.4. setting icon to turn on/off lunar/religionEvents based on Levels
/// 2. navigate back to currentDate (button) -> done
/// 3. create userEvent (button) -> done
/// 4. display selected events cards
///

// If the first day is starting on Saturdays or Sun
//    Display row with 42 items
// Otherwise, display only 36 items