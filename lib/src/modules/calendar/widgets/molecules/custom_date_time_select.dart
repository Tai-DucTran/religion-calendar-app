import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_calender/full_calender_extension.dart';
import 'package:full_calender/models/lunar_date_time.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'dart:async';

class CustomDateTimeSelect extends ConsumerStatefulWidget {
  const CustomDateTimeSelect({
    super.key,
    this.initialDate,
    required this.isStartDate,
  });

  final DateTime? initialDate;
  final bool isStartDate;

  @override
  ConsumerState<CustomDateTimeSelect> createState() =>
      _CustomDateTimeSelectThangState();
}

class _CustomDateTimeSelectThangState
    extends ConsumerState<CustomDateTimeSelect> {
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

  late FixedExtentScrollController scrollDayController,
      scrollMonthController,
      scrollYearController;

  @override
  void initState() {
    super.initState();
    _initializeDateTime();
    _initialLunarDatetime();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    scrollDayController.dispose();
    scrollMonthController.dispose();
    scrollYearController.dispose();
    super.dispose();
  }

  void _initializeDateTime() {
    final selectedDate = widget.initialDate ?? DateTime.now();
    _selectedDate = selectedDate;
    _selectedTime = const TimeOfDay(hour: 08, minute: 08);
  }

  void _initialLunarDatetime() {
    scrollDayController = FixedExtentScrollController(initialItem: 0);
    scrollMonthController = FixedExtentScrollController(initialItem: 0);
    scrollYearController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).toString();
    final isLunarCalendar =
        ref.watch(calendarCategoryControllerProvider) == CalendarCategory.lunar;
    final isAllDay = ref.watch(isAllDayToggleControllerProvider);

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
    const dateFormat = DateTimeFormat.dateMonthYear;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => isLunarCalendar
          ? _showLunarDatePicker(context)
          : _showSolarDatePicker(context),
      child: Text(
        isLunarCalendar
            ? getFullLunarDateText(
                locale: locale,
                inputDate: _selectedDate,
                dateFormat: dateFormat,
              )
            : getFullSolarDateText(
                locale: locale,
                inputDate: _selectedDate,
                dateFormat: dateFormat,
              ),
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
    late bool isLeap;
    late int timeZone;

    LunarDateTime currentLunarDate =
        convertSolarDateToLunarDate(inputDate: _selectedDate);
    selectedDay = currentLunarDate.day;
    selectedMonth = currentLunarDate.month;
    selectedYear = currentLunarDate.year;
    isLeap = currentLunarDate.isLeap;
    timeZone = currentLunarDate.timeZone;

    final List<LunarMonth> listAllLunarDaysOfYear =
        getNumberOfDaysInLunarMonths(selectedYear);

    scrollDayController =
        FixedExtentScrollController(initialItem: selectedDay - 1);

    for (int i = 0; i < listAllLunarDaysOfYear.length; i++) {
      if (selectedMonth == listAllLunarDaysOfYear[i].month &&
          isLeap == listAllLunarDaysOfYear[i].isLeap) {
        scrollMonthController = FixedExtentScrollController(initialItem: i);
      }
    }

    scrollYearController =
        FixedExtentScrollController(initialItem: selectedYear);

    List<int> listDays = getDaysInMonth(selectedMonth, selectedYear);

    List<String> listMonths = getMonthsInYear(selectedYear);

    List<int> listYears = List.generate(100, (index) => 2000 + index);

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
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
                          setModalState(() {
                            selectedDay = listDays[index];
                            final newSelectedDate = FullCalenderExtension
                                .convertLunarDateToSolarDate(LunarDateTime(
                                    year: selectedYear,
                                    month: selectedMonth,
                                    day: selectedDay,
                                    isLeap: isLeap,
                                    timeZone: timeZone))!;
                            setState(() {
                              _selectedDate = newSelectedDate;
                            });
                          });
                        },
                        children: listDays
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
                          setModalState(() {
                            final getMonth = listMonths[index];
                            isLeap = getMonth.endsWith('+');
                            selectedMonth =
                                int.parse(getMonth.replaceAll('+', ''));
                            listDays =
                                getDaysInMonth(selectedMonth, selectedYear);
                            for (var all in listAllLunarDaysOfYear) {
                              if (all.month == selectedMonth &&
                                  selectedDay > all.days) {
                                selectedDay--;
                              }
                            }
                            final newSelectedDate = FullCalenderExtension
                                .convertLunarDateToSolarDate(LunarDateTime(
                                    year: selectedYear,
                                    month: selectedMonth,
                                    day: selectedDay,
                                    isLeap: isLeap,
                                    timeZone: timeZone))!;

                            scrollDayController.jumpToItem(selectedDay - 1);
                            setState(() {
                              _selectedDate = newSelectedDate;
                            });
                          });
                        },
                        children: listMonths
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
                          setModalState(() {
                            selectedYear = listYears[index];
                            listDays =
                                getDaysInMonth(selectedMonth, selectedYear);
                            listMonths = getMonthsInYear(selectedYear);
                            final newSelectedDate = FullCalenderExtension
                                .convertLunarDateToSolarDate(LunarDateTime(
                                    year: selectedYear,
                                    month: selectedMonth,
                                    day: selectedDay,
                                    isLeap: isLeap,
                                    timeZone: timeZone))!;
                            final List<LunarMonth> listAllLunarDaysOfYear =
                                getNumberOfDaysInLunarMonths(selectedYear);
                            for (int i = 0;
                                i < listAllLunarDaysOfYear.length;
                                i++) {
                              if (convertSolarDateToLunarDate(
                                              inputDate: newSelectedDate)
                                          .month ==
                                      listAllLunarDaysOfYear[i].month &&
                                  convertSolarDateToLunarDate(
                                              inputDate: newSelectedDate)
                                          .isLeap ==
                                      listAllLunarDaysOfYear[i].isLeap) {
                                scrollMonthController.jumpToItem(i);
                              }
                            }
                            scrollDayController.jumpToItem(selectedDay - 1);
                            setState(() {
                              _selectedDate = newSelectedDate;
                            });
                          });
                        },
                        children: listYears
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
      },
    );
  }

  List<String> getMonthsInYear(int year) {
    final listAllLunarDaysOfYear = getNumberOfDaysInLunarMonths(year);
    List<String> listMonths = [];
    for (var all in listAllLunarDaysOfYear) {
      listMonths.add('${all.month}${all.isLeap ? '+' : ''}');
    }
    return listMonths;
  }

  List<int> getDaysInMonth(int month, int year) {
    final listAllLunarDaysOfYear = getNumberOfDaysInLunarMonths(year);
    int days = 0;
    for (var all in listAllLunarDaysOfYear) {
      if (month == all.month) {
        days = all.days;
      }
    }
    return List.generate(days, (index) => 1 + index);
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
