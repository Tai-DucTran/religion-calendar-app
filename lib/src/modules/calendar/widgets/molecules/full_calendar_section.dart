import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_calender/enums/time_zone.dart';
import 'package:full_calender/full_calender.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/constants/date_time_format.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/geoip_and_locales/controllers/controllers.dart';
import 'package:religion_calendar_app/src/utils/string_helper.dart';

// Provider to manage the selected date
final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

// Provider to manage the displayed month
final displayedMonthProvider = StateProvider<DateTime>((ref) => DateTime.now());

class FullCalendarSection extends ConsumerStatefulWidget {
  const FullCalendarSection({
    super.key,
    this.onDateSelected,
    this.markedDates = const {},
    this.markerBuilder,
  });

  final Function(DateTime)? onDateSelected;
  final Map<DateTime, Color> markedDates;
  final Widget Function(
    DateTime date,
    Color color,
  )? markerBuilder;

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
        _CalendarHeader(
          onPreviousMonth: () {
            _pageController.previousPage(
              duration: const Duration(
                milliseconds: 300,
              ),
              curve: Curves.easeInOut,
            );
          },
          onNextMonth: () {
            _pageController.nextPage(
              duration: const Duration(
                milliseconds: 300,
              ),
              curve: Curves.easeInOut,
            );
          },
          currentLocale: currentLocale,
        ),
        _buildWeekdayHeader(currentLocale),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              final monthDiff = index - 1000;
              final month = DateTime(
                DateTime.now().year,
                DateTime.now().month + monthDiff,
              );
              return _CalendarMonth(
                displayedMonth: month,
                markedDates: widget.markedDates,
                markerBuilder: widget.markerBuilder,
                onDateSelected: widget.onDateSelected,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeekdayHeader(String currentLocale) {
    final weekDayNames = getWeekDayNames(
      locale: currentLocale,
      isShortName: true,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: weekDayNames
            .map(
              (day) => SizedBox(
                child: Center(
                  child: Text(
                    day,
                    style: AriesTextStyles.textBodyMedium.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _CalendarHeader extends ConsumerWidget {
  const _CalendarHeader({
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.currentLocale,
  });

  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final String currentLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayedMonth = ref.watch(displayedMonthProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat(
              DateTimeFormat.monthYear,
              currentLocale,
            )
                .format(
                  displayedMonth,
                )
                .toCapitalized(),
            style: AriesTextStyles.textHeading5,
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: AriesColor.yellowP300,
                ),
                onPressed: onPreviousMonth,
              ),
              IconButton(
                icon: const Icon(
                  Icons.chevron_right,
                  color: AriesColor.yellowP300,
                ),
                onPressed: onNextMonth,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CalendarMonth extends ConsumerWidget {
  const _CalendarMonth({
    required this.displayedMonth,
    required this.markedDates,
    required this.onDateSelected,
    this.markerBuilder,
  });

  final DateTime displayedMonth;
  final Map<DateTime, Color> markedDates;
  final Function(DateTime)? onDateSelected;
  final Widget Function(
    DateTime date,
    Color color,
  )? markerBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final daysInMonth =
        DateTime(displayedMonth.year, displayedMonth.month + 1, 0).day;
    final firstDayOfMonth =
        DateTime(displayedMonth.year, displayedMonth.month, 1);
    final firstWeekday = firstDayOfMonth.weekday;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: 42,
      padding: const EdgeInsets.all(8),
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

        return _DateCell(
          date: date,
          isSelected: isSelected,
          isToday: isToday,
          hasMarker: hasMarker,
          markerColor: markedDates[date],
          markerBuilder: markerBuilder,
          onTap: () {
            ref.read(selectedDateProvider.notifier).state = date;
            onDateSelected?.call(date);
          },
        );
      },
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}

class _DateCell extends StatelessWidget {
  const _DateCell({
    required this.date,
    required this.isSelected,
    required this.isToday,
    required this.hasMarker,
    required this.onTap,
    this.markerColor,
    this.markerBuilder,
  });

  final DateTime date;
  final bool isSelected;
  final bool isToday;
  final bool hasMarker;
  final VoidCallback onTap;
  final Color? markerColor;
  final Widget Function(
    DateTime date,
    Color color,
  )? markerBuilder;

  @override
  Widget build(BuildContext context) {
    final String currentLocale = Localizations.localeOf(context).toString();

    final lunarDate = FullCalender(
      date: date,
      timeZone: TimeZone.vietnamese.timezone,
    ).lunarDate;

    final isImportance = isImportantDay(lunarDate);

    print('Tai logs - isImportance: $isImportance');

    final formattedLunarDateText = LunarDateFormatter.format(
      lunarDate,
      isImportance ? DateTimeFormat.dayMonth : DateTimeFormat.day,
      currentLocale,
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isToday
              ? AriesColor.yellowP100
              : isSelected
                  ? AriesColor.yellowP300
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(
            4.r,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 4,
              child: Text(
                date.day.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.black : AriesColor.neutral900,
                  fontWeight: isSelected || isToday
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              // right: 1,
              child: Text(
                formattedLunarDateText.toString(),
                style: AriesTextStyles.textBodySmall.copyWith(
                  fontSize: 12,
                  color: isImportance
                      ? AriesColor.danger200
                      : AriesColor.neutral100,
                ),
              ),
            ),
            if (hasMarker && markerBuilder == null)
              Positioned(
                bottom: 6,
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: markerColor ?? Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
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

