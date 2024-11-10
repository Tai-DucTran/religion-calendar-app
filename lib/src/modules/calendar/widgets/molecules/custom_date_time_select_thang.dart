import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_calender/full_calender_extension.dart';
import 'package:full_calender/models/lunar_date_time.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'dart:async';

import 'package:religion_calendar_app/src/utils/log.dart';

class CustomDateTimeSelectThang extends ConsumerStatefulWidget {
  const CustomDateTimeSelectThang({
    super.key,
    this.initialDate,
    required this.isStartDate,
  });

  final DateTime? initialDate;
  final bool isStartDate;

  @override
  ConsumerState<CustomDateTimeSelectThang> createState() =>
      _CustomDateTimeSelectThangState();
}

class _CustomDateTimeSelectThangState
    extends ConsumerState<CustomDateTimeSelectThang> {
  /// [_debounce], [_pendingUpdate], [_isScrolling], [_scrollSettleTime]
  /// These values helps to resolve the issue
  ///! ERROR:flutter/impeller/base/validation.cc(59)] Break on 'ImpellerValidationBreak'
  ///! to inspect point of failure: Could not find font in the atlas.
  ///
  /// This happens because the state of rendered time update so frequently along with
  /// the frequency of updates and the likelihood of race conditions of dateTime
  ///
  ///* Solution:
  /// - introduces a delay before applying updates, which can help prevent rapid.
  /// - before updating the dateTime value on screen, it need to wait [_scrollSettleTime]
  ///  to ensure the scrolling behavior in [CupertinoDatePicker] stops completely
  ///
  /// TODO (Tai): Refactor this widget, self implementation instead of using [CupertinoDatePicker]
  /// Consider to refactor if the app reach over 10k users or we want to support different calendar
  /// categories such as Islamic lunar calendar using [hijri] library
  /// source: https://pub.dev/packages/hijri

  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  Timer? _debounce;
  DateTime? _pendingUpdate;
  bool _isScrolling = false;
  static const _scrollSettleTime = Duration(milliseconds: 200);

  late DateTime currentLunarDate;

  @override
  void initState() {
    super.initState();
    _initializeDateTime();
    _initialLunarDatetime();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _initializeDateTime() {
    final selectedDate = widget.initialDate ?? DateTime.now();
    _selectedDate = selectedDate;
    _selectedTime = const TimeOfDay(hour: 08, minute: 08);
  }

  void _initialLunarDatetime() {}

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).toString();
    final isLunarCalendar =
        ref.watch(calendarCategoryControllerProvider) == CalendarCategory.lunar;
    final isAllDay = ref.watch(isAllDayToggleControllerProvider);
    final currentEventDateTime = ref.watch(eventDateTimeControllerProvider);
    print('Tai logs - currentEventDateTime $currentEventDateTime');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 22.w,
            ),
            Spacing.sp8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDateButton(
                  context,
                  currentLocale,
                  isLunarCalendar,
                ),
                _buildDateSubtitle(
                  currentLocale,
                  isLunarCalendar,
                ),
              ],
            ),
            const Spacer(),
            if (!isAllDay) _buildTimeButton(context, currentLocale),
          ],
        ),
      ],
    );
  }

  Widget _buildDateButton(
      BuildContext context, String locale, bool isLunarCalendar) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => isLunarCalendar
          ? _showLunarDatePicker(context)
          : _showSolarDatePicker(context),
      child: Text(
        DateFormat(
          DateTimeFormat.dateMonthYear,
          locale,
        ).format(isLunarCalendar
            ? convertToLunarDate(inputDate: _selectedDate)
            : _selectedDate),
        style: AriesTextStyles.textBodyNormal.copyWith(
          color: AriesColor.yellowP300,
        ),
      ),
    );
  }

  Widget _buildDateSubtitle(String locale, bool isLunarCalendar) {
    const dateFormat = DateTimeFormat.dateMonth;
    final calendarCategoryLabel = isLunarCalendar
        ? LocalizedKeys.calendarCategorySolarText
        : LocalizedKeys.calendarCategoryLunarText;

    final lunarDate = LunarDateTime(
        year: _selectedDate.year,
        month: _selectedDate.month,
        day: _selectedDate.day);
    final solarDateFromLunar =
        FullCalenderExtension.convertLunarDateToSolarDate(lunarDate)!;
    print('Tai logs - solarDateFromLunar $solarDateFromLunar');
    solarDateFromLunar.log();
    final subDateLabel = isLunarCalendar
        ? getFullSolarDateText(
            locale: locale,
            inputDate: _selectedDate,
            dateFormat: dateFormat,
          )
        : getFullLunarDateText(
            locale: locale,
            inputDate: _selectedDate,
            dateFormat: dateFormat,
          );

    return Text(
      '$calendarCategoryLabel $subDateLabel',
      style: AriesTextStyles.textBodySmall,
    );
  }

  Widget _buildTimeButton(BuildContext context, String locale) {
    return CupertinoButton(
      padding: const EdgeInsets.only(bottom: 0),
      onPressed: () => _showTimePicker(context),
      child: Text(
        _selectedTime.format(context),
        style: AriesTextStyles.textBodySmall,
      ),
    );
  }

  void _showLunarDatePicker(BuildContext context) {
    late int selectedYear, selectedMonth, selectedDay;
    late FixedExtentScrollController scrollDayController,
        scrollMonthController,
        scrollYearController;

    DateTime currentLunarDate = convertToLunarDate(inputDate: _selectedDate);
    selectedDay = currentLunarDate.day;
    selectedMonth = currentLunarDate.month;
    selectedYear = currentLunarDate.year;

    scrollDayController =
        FixedExtentScrollController(initialItem: selectedDay - 1);
    scrollMonthController =
        FixedExtentScrollController(initialItem: selectedMonth - 1);
    scrollYearController =
        FixedExtentScrollController(initialItem: selectedYear);

    List<int> getDays(DateTime selectedDate) {
      List<int> allDays = [];
      List<DateTime> days = getListDaysOfAMonthLunarYear(
          month: selectedMonth, year: selectedYear);
      for (DateTime day in days) {
        allDays.add(day.day);
      }
      //print('Day: $selectedDay, month: $selectedMonth, year: $selectedYear, days: $allDays');
      return allDays;
    }

    List<int> getMonths(DateTime selectedDate) {
      return List.generate(12, (index) => index + 1);
    }

    List<int> getYears() {
      getAllDaysOfALunarYear(year: selectedYear);
      return List.generate(100, (index) => 2000 + index);
    }

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: AriesColor.neutral0,
          child: NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60.w,
                  height: 250,
                  child: CupertinoPicker(
                    scrollController: scrollDayController,
                    looping: true,
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedDay = getDays(_selectedDate)[index];
                        _selectedDate = convertToSolarDate(
                            inputDate: DateTime(
                                selectedYear, selectedMonth, selectedDay));
                      });
                    },
                    children: getDays(_selectedDate)
                        .map(
                          (day) => Center(
                            child: Text(
                              day.toString(),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 120.w,
                  height: 250,
                  child: CupertinoPicker(
                    scrollController: scrollMonthController,
                    looping: true,
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedMonth = getMonths(_selectedDate)[index];
                      });
                    },
                    children: getMonths(_selectedDate)
                        .map(
                          (month) => Center(
                            child: Text('tháng $month'),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  height: 250,
                  child: CupertinoPicker(
                    scrollController: scrollYearController,
                    looping: true,
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedYear = getYears()[index];
                      });
                    },
                    children: getYears()
                        .map(
                          (year) => Center(
                            child: Text(
                              year.toString(),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSolarDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: AriesColor.neutral0,
          child: NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: _selectedDate,
              onDateTimeChanged: (DateTime newDate) {
                _handleDateTimeChange(newDate, isDate: true);
              },
            ),
          ),
        );
      },
    );
  }

  void _showTimePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: AriesColor.neutral0,
          child: NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              use24hFormat: true,
              initialDateTime: DateTime(_selectedDate.year, _selectedDate.month,
                  _selectedDate.day, _selectedTime.hour, _selectedTime.minute),
              onDateTimeChanged: (DateTime newTime) {
                _handleDateTimeChange(newTime, isDate: false);
              },
            ),
          ),
        );
      },
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollStartNotification) {
      _isScrolling = true;
    } else if (notification is ScrollEndNotification) {
      _isScrolling = false;
      _applyPendingUpdate();
    }
    return true;
  }

  void _handleDateTimeChange(DateTime newDateTime, {required bool isDate}) {
    _pendingUpdate = newDateTime;
    _debounce?.cancel();
    _debounce = Timer(_scrollSettleTime, () {
      if (!_isScrolling) {
        _applyPendingUpdate();
      }
    });
  }

  void _applyPendingUpdate() {
    if (_pendingUpdate != null) {
      setState(() {
        if (widget.isStartDate) {
          ref
              .read(eventDateTimeControllerProvider.notifier)
              .setStartDate(_pendingUpdate!);
          if (!ref.read(isAllDayToggleControllerProvider)) {
            ref
                .read(eventDateTimeControllerProvider.notifier)
                .setStartTime(_pendingUpdate!);
          }
        } else {
          ref
              .read(eventDateTimeControllerProvider.notifier)
              .setEndDate(_pendingUpdate!);
          if (!ref.read(isAllDayToggleControllerProvider)) {
            ref
                .read(eventDateTimeControllerProvider.notifier)
                .setEndTime(_pendingUpdate!);
          }
        }
        _selectedDate = DateTime(
            _pendingUpdate!.year, _pendingUpdate!.month, _pendingUpdate!.day);
        if (!ref.read(isAllDayToggleControllerProvider)) {
          _selectedTime = TimeOfDay.fromDateTime(_pendingUpdate!);
        }
      });
      _pendingUpdate = null;
    }
  }
}
