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
    required this.isStartDate,
  });

  final bool isStartDate;

  @override
  ConsumerState<CustomDateTimeSelect> createState() =>
      _CustomDateTimeSelectState();
}

class _CustomDateTimeSelectState extends ConsumerState<CustomDateTimeSelect> {
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

  late DateTime limitedDay, _selectedDate;
  late LunarDateTime limitedDayInLunar;
  late TimeOfDay _selectedTime;

  Timer? _debounce;
  DateTime? _pendingUpdate;
  bool _isScrolling = false;
  static const _scrollSettleTime = Duration(milliseconds: 200);

  bool isProgrammaticScroll = false;

  late DateTime currentLunarDate;

  late FixedExtentScrollController scrollDayController,
      scrollMonthController,
      scrollYearController;

  @override
  void initState() {
    super.initState();
    _initializeDateTime();
    _initializeFixedExtentScrollController();
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
    limitedDay = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    limitedDayInLunar = convertSolarDateToLunarDate(inputDate: limitedDay);
    _selectedDate = limitedDay;
    _selectedTime = const TimeOfDay(hour: 08, minute: 08);
  }

  void _initializeFixedExtentScrollController() {
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

    bool isStartDayChange = ref.watch(isStartDayChangeControllerProvider);
    var eventDateTime = ref.watch(eventDateTimeControllerProvider);
    ref.watch(previousSelectedDateControllerProvider);

    if (!widget.isStartDate && isStartDayChange) {
      limitedDay = eventDateTime.startDate;
      limitedDayInLunar = convertSolarDateToLunarDate(inputDate: limitedDay);
      _selectedDate = limitedDay;
    }

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

  void _showSolarDatePicker(BuildContext context) {
    late int selectedYear, selectedMonth, selectedDay;

    bool isLeap = false;

    selectedDay = _selectedDate.day;
    selectedMonth = _selectedDate.month;
    selectedYear = _selectedDate.year;

    DateTime startDate = ref.watch(previousSelectedDateControllerProvider);

    scrollDayController = FixedExtentScrollController(
        initialItem: (!widget.isStartDate &&
                startDate.month == selectedMonth &&
                startDate.year == selectedYear)
            ? selectedDay - startDate.day
            : selectedDay - 1);

    scrollMonthController = FixedExtentScrollController(
        initialItem: (!widget.isStartDate && startDate.year == selectedYear)
            ? selectedMonth - startDate.month
            : selectedMonth - 1);

    scrollYearController = FixedExtentScrollController(
        initialItem: !widget.isStartDate
            ? selectedYear - startDate.year
            : selectedYear - 2000);

    List<int> listDays = getDaysInASolarMonth(selectedMonth, selectedYear);

    List<String> listMonths = getMonthsInASolarYear(selectedYear);

    List<int> listYears = getYears();

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DatePickerModal(
              scrollDayController: scrollDayController,
              scrollMonthController: scrollMonthController,
              scrollYearController: scrollYearController,
              listDays: listDays,
              listMonths: listMonths,
              listYears: listYears,
              isProgrammaticScroll: isProgrammaticScroll,
              handleScrollNotification: _handleScrollNotification,
              onDayChanged: (index) {
                if (!isProgrammaticScroll) {
                  setModalState(() {
                    isStartDayChange();
                    selectedDay = listDays[index];
                  });
                  (
                    listDays,
                    listMonths,
                    selectedDay,
                    selectedMonth,
                    selectedYear,
                    isLeap
                  ) = processSelectedDay(selectedDay, selectedMonth,
                      selectedYear, false, isLeap, 0, 1);
                }
              },
              onMonthChanged: (index) {
                if (!isProgrammaticScroll) {
                  setModalState(() {
                    isStartDayChange();
                    selectedMonth = int.parse(listMonths[index]);
                  });
                  (
                    listDays,
                    listMonths,
                    selectedDay,
                    selectedMonth,
                    selectedYear,
                    isLeap
                  ) = processSelectedDay(selectedDay, selectedMonth,
                      selectedYear, false, isLeap, 0, 2);
                }
              },
              onYearChanged: (index) {
                if (!isProgrammaticScroll) {
                  setModalState(() {
                    isStartDayChange();
                    selectedYear = listYears[index];
                  });
                  (
                    listDays,
                    listMonths,
                    selectedDay,
                    selectedMonth,
                    selectedYear,
                    isLeap
                  ) = processSelectedDay(selectedDay, selectedMonth,
                      selectedYear, false, isLeap, 0, 3);
                }
              },
            );
          },
        );
      },
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

    DateTime startDate = ref.watch(previousSelectedDateControllerProvider);
    LunarDateTime startDateInLunar =
        convertSolarDateToLunarDate(inputDate: startDate);

    List<LunarMonth> listAllLunarDaysOfYear =
        getNumberOfDaysInLunarMonths(selectedYear);

    scrollDayController = FixedExtentScrollController(
        initialItem: (!widget.isStartDate &&
                startDateInLunar.month == selectedMonth &&
                startDateInLunar.year == selectedYear)
            ? selectedDay - startDateInLunar.day
            : selectedDay - 1);

    int leapMonth = getLeapMonth(selectedYear);

    for (int i = 0; i < listAllLunarDaysOfYear.length; i++) {
      if (selectedMonth == listAllLunarDaysOfYear[i].month &&
          isLeap == listAllLunarDaysOfYear[i].isLeap) {
        if (!widget.isStartDate && startDateInLunar.year == selectedYear) {
          if (leapMonth == 0 || (leapMonth != 0 && i < leapMonth)) {
            scrollMonthController = FixedExtentScrollController(
                initialItem: i + 1 - startDateInLunar.month);
          } else {
            scrollMonthController = FixedExtentScrollController(
                initialItem: i - startDateInLunar.month);
          }
        } else {
          scrollMonthController = FixedExtentScrollController(initialItem: i);
        }
        break;
      }
    }

    scrollYearController = FixedExtentScrollController(
        initialItem: !widget.isStartDate
            ? selectedYear - startDateInLunar.year
            : selectedYear - 2000);

    List<int> listDays =
        getDaysInALunarMonth(selectedMonth, selectedYear, isLeap);

    List<String> listMonths = getMonthsInALunarYear(selectedYear);

    List<int> listYears = getYears();

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DatePickerModal(
              scrollDayController: scrollDayController,
              scrollMonthController: scrollMonthController,
              scrollYearController: scrollYearController,
              listDays: listDays,
              listMonths: listMonths,
              listYears: listYears,
              isProgrammaticScroll: isProgrammaticScroll,
              handleScrollNotification: _handleScrollNotification,
              onDayChanged: (index) {
                if (!isProgrammaticScroll) {
                  setModalState(() {
                    isStartDayChange();
                    selectedDay = listDays[index];
                  });
                  (
                    listDays,
                    listMonths,
                    selectedDay,
                    selectedMonth,
                    selectedYear,
                    isLeap
                  ) = processSelectedDay(selectedDay, selectedMonth,
                      selectedYear, true, isLeap, timeZone, 1);
                }
              },
              onMonthChanged: (index) {
                if (!isProgrammaticScroll) {
                  setModalState(() {
                    isStartDayChange();
                    final getMonth = listMonths[index];
                    isLeap = getMonth.endsWith('+');
                    selectedMonth = int.parse(getMonth.replaceAll('+', ''));
                  });
                  (
                    listDays,
                    listMonths,
                    selectedDay,
                    selectedMonth,
                    selectedYear,
                    isLeap
                  ) = processSelectedDay(selectedDay, selectedMonth,
                      selectedYear, true, isLeap, timeZone, 2);
                }
              },
              onYearChanged: (index) {
                if (!isProgrammaticScroll) {
                  setModalState(() {
                    isStartDayChange();
                    selectedYear = listYears[index];
                  });
                  (
                    listDays,
                    listMonths,
                    selectedDay,
                    selectedMonth,
                    selectedYear,
                    isLeap
                  ) = processSelectedDay(selectedDay, selectedMonth,
                      selectedYear, true, isLeap, timeZone, 3);
                }
              },
            );
          },
        );
      },
    );
  }

  void setSelectedDay(DateTime selectedDate) {
    return setState(() {
      _selectedDate = selectedDate;
      if (widget.isStartDate) {
        ref
            .read(eventDateTimeControllerProvider.notifier)
            .setStartDate(_selectedDate);
        ref
            .read(eventDateTimeControllerProvider.notifier)
            .setEndDate(_selectedDate);
      } else {
        ref
            .read(eventDateTimeControllerProvider.notifier)
            .setEndDate(_selectedDate);
      }
    });
  }

  (List<int>, List<String>, int, dynamic, int, bool) processSelectedDay(
      selectedDay,
      selectedMonth,
      selectedYear,
      isLunarCalendar,
      isLeap,
      timeZone,
      typeChange) {
    DateTime startDate = ref.watch(previousSelectedDateControllerProvider);
    LunarDateTime startDateInLunar =
        convertSolarDateToLunarDate(inputDate: startDate);

    List<String> listMonths = isLunarCalendar
        ? getMonthsInALunarYear(selectedYear)
        : getMonthsInASolarYear(selectedYear);

    if (isLeap && listMonths.length == 12) {
      isLeap = false;
    }

    List<int> listDays = isLunarCalendar
        ? getDaysInALunarMonth(selectedMonth, selectedYear, isLeap)
        : getDaysInASolarMonth(selectedMonth, selectedYear);

    if (!listMonths.contains('$selectedMonth${isLeap ? '+' : ''}')) {
      selectedMonth =
          isLunarCalendar ? startDateInLunar.month : startDate.month;
      isLeap = startDateInLunar.isLeap;
      listDays = isLunarCalendar
          ? getDaysInALunarMonth(selectedMonth, selectedYear, isLeap)
          : getDaysInASolarMonth(selectedMonth, selectedYear);
    }

    selectedDay = listDays.contains(selectedDay)
        ? selectedDay
        : isLunarCalendar
            ? startDateInLunar.day
            : startDate.day;

    if (selectedDay > listDays[listDays.length - 1]) {
      selectedDay = listDays[listDays.length - 1];
    }

    int leapMonth = getLeapMonth(selectedYear);

    LunarDateTime selectedDateInLunar = LunarDateTime(
      year: selectedYear,
      month: selectedMonth,
      day: selectedDay,
      isLeap: isLeap,
      timeZone: timeZone,
    );

    DateTime selectedDate = isLunarCalendar
        ? FullCalenderExtension.convertLunarDateToSolarDate(
            selectedDateInLunar)!
        : DateTime(
            selectedYear,
            selectedMonth,
            selectedDay,
          );

    if (typeChange > 1) {
      isProgrammaticScroll = true;
      scrollDayController.jumpToItem(isLunarCalendar
          ? (!widget.isStartDate &&
                  selectedDateInLunar.month == startDateInLunar.month &&
                  selectedDateInLunar.year == startDateInLunar.year)
              ? selectedDateInLunar.day - startDateInLunar.day
              : selectedDateInLunar.day - 1
          : (!widget.isStartDate &&
                  selectedDate.month == startDate.month &&
                  selectedDate.year == startDate.year)
              ? selectedDate.day - startDate.day
              : selectedDate.day - 1);
      isProgrammaticScroll = false;

      if (typeChange > 2) {
        isProgrammaticScroll = true;

        scrollMonthController.jumpToItem(isLunarCalendar
            ? !widget.isStartDate &&
                    selectedDateInLunar.year == startDateInLunar.year
                ? selectedDateInLunar.month - startDateInLunar.month
                : leapMonth == 0
                    ? selectedDateInLunar.month - 1
                    : selectedDateInLunar.month < leapMonth
                        ? selectedDateInLunar.month - 1
                        : selectedDateInLunar.month == leapMonth
                            ? isLeap
                                ? selectedDateInLunar.month
                                : selectedDateInLunar.month - 1
                            : selectedDateInLunar.month
            : (!widget.isStartDate && selectedDate.year == startDate.year)
                ? selectedDate.month - startDate.month
                : selectedDate.month - 1);
        isProgrammaticScroll = false;
      }
    }

    setSelectedDay(selectedDate);
    if (widget.isStartDate) {
      ref
          .read(previousSelectedDateControllerProvider.notifier)
          .set(selectedDate);
    }

    return (
      listDays,
      listMonths,
      selectedDay,
      selectedMonth,
      selectedYear,
      isLeap
    );
  }

  List<int> getDaysInASolarMonth(int month, int year) {
    DateTime startDate = ref.watch(previousSelectedDateControllerProvider);
    final listAllSolarDaysOfYear = getNumberOfDaysInSolarMonths(year);
    List<int> listDays =
        List.generate(listAllSolarDaysOfYear[month]!, (index) => 1 + index);
    if (!widget.isStartDate &&
        startDate.month == month &&
        startDate.year == year) {
      listDays = listDays.sublist(startDate.day - 1);
    }
    return listDays;
  }

  List<int> getDaysInALunarMonth(int month, int year, bool isLeap) {
    DateTime startDate = ref.watch(previousSelectedDateControllerProvider);
    LunarDateTime startDateInLunar =
        convertSolarDateToLunarDate(inputDate: startDate);
    final listAllLunarDaysOfYear = getNumberOfDaysInLunarMonths(year);

    int days = 0;
    for (var all in listAllLunarDaysOfYear) {
      if (month == all.month && isLeap == all.isLeap) {
        days = all.days;
      }
    }
    List<int> listDays = List.generate(days, (index) => 1 + index);
    if (!widget.isStartDate &&
        startDateInLunar.month == month &&
        startDateInLunar.year == year) {
      listDays = listDays.sublist(startDateInLunar.day - 1);
    }

    return listDays;
  }

  List<String> getMonthsInASolarYear(int year) {
    DateTime startDate = ref.watch(previousSelectedDateControllerProvider);

    List<String> listMonths =
        List.generate(12, (index) => (1 + index).toString());
    if (!widget.isStartDate && startDate.year == year) {
      listMonths = listMonths.sublist(startDate.month - 1);
    }
    return listMonths;
  }

  List<String> getMonthsInALunarYear(int year) {
    DateTime startDate = ref.watch(previousSelectedDateControllerProvider);
    LunarDateTime startDateInLunar =
        convertSolarDateToLunarDate(inputDate: startDate);
    int isLeapMonth = getLeapMonth(year);
    final listAllLunarDaysOfYear = getNumberOfDaysInLunarMonths(year);
    List<String> listMonths = [];

    for (var all in listAllLunarDaysOfYear) {
      listMonths.add('${all.month}${all.isLeap ? '+' : ''}');
    }
    if (!widget.isStartDate && startDateInLunar.year == year) {
      int startIndex = startDateInLunar.month - 1;

      if (isLeapMonth > 0) {
        if (startDateInLunar.month > isLeapMonth ||
            (startDateInLunar.month == isLeapMonth &&
                startDateInLunar.isLeap)) {
          startIndex = startDateInLunar.month;
        }
      }

      listMonths = listMonths.sublist(startIndex);
    }
    return listMonths;
  }

  int getLeapMonth(int year) {
    final listAllLunarDaysOfYear = getNumberOfDaysInLunarMonths(year);

    for (int i = 0; i < listAllLunarDaysOfYear.length; i++) {
      if (listAllLunarDaysOfYear[i].isLeap) {
        return i;
      }
    }
    return 0;
  }

  List<int> getYears() {
    DateTime startDate = ref.watch(previousSelectedDateControllerProvider);

    List<int> listYears = List.generate(100, (index) => 2000 + index);
    if (!widget.isStartDate) {
      listYears = listYears.sublist(startDate.year - 2000);
    }
    return listYears;
  }

  void isStartDayChange() {
    if (widget.isStartDate) {
      ref.read(isStartDayChangeControllerProvider.notifier).changed();
    } else {
      ref.read(isStartDayChangeControllerProvider.notifier).unChanged();
    }
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
