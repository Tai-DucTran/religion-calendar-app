import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_calender/full_calender_extension.dart';
import 'package:full_calender/models/lunar_date_time.dart';
import 'package:intl/intl.dart';
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

  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  Timer? _debounce;
  DateTime? _pendingUpdate;
  bool _isScrolling = false;
  static const _scrollSettleTime = Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    _initializeDateTime();
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

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).toString();
    final isLunarCalendar =
        ref.watch(calendarCategoryControllerProvider) == CalendarCategory.lunar;
    final isAllDay = ref.watch(isAllDayToggleControllerProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLeadingLabel(),
        Spacing.sp4,
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildDateButton(
              context,
              currentLocale,
            ),
            _buildDateSubtitle(
              currentLocale,
              isLunarCalendar,
            )
          ],
        ),
        Spacing.sp16,
        if (!isAllDay) _buildTimeButton(context, currentLocale),
      ],
    );
  }

  Widget _buildLeadingLabel() {
    // A work arround to ensure those component having same padding.
    return CupertinoButton(
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      onPressed: () {},
      child: Text(
        widget.isStartDate ? LocalizedKeys.fromText : LocalizedKeys.toText,
        style: AriesTextStyles.textHeading6.copyWith(
          color: AriesColor.black,
        ),
      ),
    );
  }

  Widget _buildDateButton(BuildContext context, String locale) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      onPressed: () => _showDatePicker(context),
      child: Text(
        DateFormat(
          DateTimeFormat.dateMonthYear,
          locale,
        ).format(
          _selectedDate,
        ),
        style: AriesTextStyles.textHeading6.copyWith(
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
            inputDate: solarDateFromLunar,
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
        style: AriesTextStyles.textHeading6,
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
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
