import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/geoip_and_locales/controllers/controllers.dart';

class FullCalendarSection extends ConsumerStatefulWidget {
  const FullCalendarSection({
    super.key,
    this.onDateSelected,
  });

  final Function(DateTime)? onDateSelected;

  @override
  ConsumerState<FullCalendarSection> createState() =>
      _FullCalendarSectionState();
}

class _FullCalendarSectionState extends ConsumerState<FullCalendarSection> {
  late PageController _pageController;
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime.now();
    // Start at a large index to allow scrolling backwards
    _pageController = PageController(initialPage: 1000);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    final monthDiff = page - 1000;
    _currentMonth = DateTime(
      DateTime.now().year,
      DateTime.now().month + monthDiff,
    );
    ref.read(displayedMonthProvider.notifier).state = _currentMonth;
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = ref.watch(localeControllerProvider).languageCode;

    return Column(
      children: [
        FullMonthCalendarHeader(
          controller: _pageController,
          currentLocale: currentLocale,
        ),
        Spacing.sp16,
        FullCalendarWeekdayHeader(
          currentLocale: currentLocale,
        ),
        Spacing.sp4,
        Expanded(
          child: FullCalendarDaysInMonth(
            controller: _pageController,
            onPageChanged: _onPageChanged,
          ),
        ),
        const FullCalendarUltilsAndEventsSection()
      ],
    );
  }
}

/// Features in this pages:
/// 1. Display full month calendar
/// 1.1. including lunar calendar
/// 1.2. including userEvents
/// 1.3. including religionEvents
/// 1.4. setting icon to turn on/off lunar/religionEvents based on Levels
/// 2. navigate back to currentDate (button)
/// 3. create userEvent (button)
/// 4. display selected events cards
///

// If the first day is starting on Saturdays or Sun
//    Display row with 42 items
// Otherwise, display only 36 items