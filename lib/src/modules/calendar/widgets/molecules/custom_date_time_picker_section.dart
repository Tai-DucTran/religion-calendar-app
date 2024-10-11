import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'dart:async';

class CustomDateTimePicker extends ConsumerStatefulWidget {
  const CustomDateTimePicker({
    super.key,
    this.initialDate,
    required this.isStartDate,
  });

  final DateTime? initialDate;
  final bool isStartDate;

  @override
  ConsumerState<CustomDateTimePicker> createState() =>
      _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends ConsumerState<CustomDateTimePicker> {
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
    final currentEventDateTime = ref.watch(eventDateTimeControllerProvider);
    print('Tai logs - currentEventDateTime $currentEventDateTime');

    return ListTile(
      isThreeLine: true,
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: _buildLeadingLabel(),
      title: _buildDateButton(context, currentLocale),
      subtitle: _buildDateSubtitle(currentLocale, isLunarCalendar),
      trailing: isAllDay ? null : _buildTimeButton(context, currentLocale),
    );
  }

  Widget _buildLeadingLabel() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        width: 85,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AriesColor.neutral50),
        ),
        child: Text(
          widget.isStartDate
              ? LocalizedKeys.startingEventDateText
              : LocalizedKeys.endingEventDateText,
        ),
      ),
    );
  }

  Widget _buildDateButton(BuildContext context, String locale) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      onPressed: () => _showDatePicker(context),
      child: Text(
        DateFormat(DateTimeFormat.dateShortMonthYear, locale)
            .format(_selectedDate),
      ),
    );
  }

  Widget _buildDateSubtitle(String locale, bool isLunarCalendar) {
    final calendarCategoryLabel = isLunarCalendar
        ? LocalizedKeys.calendarCategorySolarText
        : LocalizedKeys.calendarCategoryLunarText;

    return Text(
      '$calendarCategoryLabel ${getFullLunarDateText(
        locale: locale,
        inputDate: _selectedDate,
        dateFormat: (DateTimeFormat.dateMonth),
      )}',
      style: AriesTextStyles.textBodySmall,
    );
  }

  Widget _buildTimeButton(BuildContext context, String locale) {
    return CupertinoButton(
      padding: const EdgeInsets.only(bottom: 0),
      onPressed: () => _showTimePicker(context),
      child: Text(
        _selectedTime.format(context),
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
