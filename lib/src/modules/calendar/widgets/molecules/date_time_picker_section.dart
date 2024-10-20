import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'dart:async';

class DateTimePickerSection extends ConsumerStatefulWidget {
  const DateTimePickerSection({
    super.key,
    required this.initialDate,
    required this.isStartDate,
  });

  final DateTime? initialDate;
  final bool isStartDate;

  @override
  ConsumerState<DateTimePickerSection> createState() =>
      _DateTimePickerSectionState();
}

class _DateTimePickerSectionState extends ConsumerState<DateTimePickerSection> {
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
  Timer? _debounce;
  DateTime? _pendingUpdate;
  bool _isScrolling = false;
  static const _scrollSettleTime = Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    _initializeDate();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _initializeDate() {
    if (widget.initialDate != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final controller = ref.read(eventDateTimeControllerProvider.notifier);
        if (widget.isStartDate) {
          controller.setStartDate(widget.initialDate!);
          controller.setStartTime(DateTime(widget.initialDate!.year,
              widget.initialDate!.month, widget.initialDate!.day, 8, 0));
        } else {
          controller.setEndDate(widget.initialDate!);
          controller.setEndTime(DateTime(widget.initialDate!.year,
              widget.initialDate!.month, widget.initialDate!.day, 23, 0));
        }
      });
    }
  }

  @override
  void didUpdateWidget(DateTimePickerSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDate != oldWidget.initialDate) {
      _initializeDate();
    }
  }

  void _onScrollStart() {
    if (!_isScrolling) {
      setState(() {
        _isScrolling = true;
      });
    }
  }

  void _onScrollEnd(DateTime newDateTime, bool isDate) {
    _pendingUpdate = newDateTime;
    _debounce?.cancel();
    _debounce = Timer(_scrollSettleTime, () {
      if (mounted) {
        setState(() {
          _isScrolling = false;
        });
        _updateDateTime(isDate);
      }
      _updateDateTime(isDate);
    });
  }

  void _updateDateTime(bool isDate) {
    if (_pendingUpdate != null) {
      if (widget.isStartDate) {
        if (isDate) {
          ref
              .read(eventDateTimeControllerProvider.notifier)
              .setStartDate(_pendingUpdate!);
        } else {
          ref
              .read(eventDateTimeControllerProvider.notifier)
              .setStartTime(_pendingUpdate!);
        }
      } else {
        if (isDate) {
          ref
              .read(eventDateTimeControllerProvider.notifier)
              .setEndDate(_pendingUpdate!);
        } else {
          ref
              .read(eventDateTimeControllerProvider.notifier)
              .setEndTime(_pendingUpdate!);
        }
      }
      _pendingUpdate = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventDateTime = ref.watch(eventDateTimeControllerProvider);
    final isAllDay = ref.watch(isAllDayToggleControllerProvider);
    final isLunarCalendar =
        ref.watch(calendarCategoryControllerProvider) == CalendarCategory.lunar;

    final currentLocale = Localizations.localeOf(context).toString();

    final date =
        widget.isStartDate ? eventDateTime.startDate : eventDateTime.endDate;
    final time =
        widget.isStartDate ? eventDateTime.startTime : eventDateTime.endTime;

    return ListTile(
      isThreeLine: true,
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: _buildLeadingLabel(),
      title: _buildDateButton(context, date, currentLocale),
      subtitle: DateSubtitlePicker(
        locale: currentLocale,
        selectedDate: date,
        isLunarCalendar: isLunarCalendar,
      ),
      trailing: !isAllDay
          ? _buildTimeButton(context, time!, currentLocale)
          : const Offstage(),
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
          widget.isStartDate ? LocalizedKeys.fromText : LocalizedKeys.toText,
        ),
      ),
    );
  }

  Widget _buildDateButton(BuildContext context, DateTime date, String locale) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      onPressed: () => _showDatePicker(context, date),
      child: Text(
        DateFormat(DateTimeFormat.dateShortMonthYear, locale).format(date),
      ),
    );
  }

  Widget _buildTimeButton(BuildContext context, DateTime time, String locale) {
    return CupertinoButton(
      padding: const EdgeInsets.only(bottom: 0),
      onPressed: () => _showTimePicker(context, time),
      child: Text(
        DateFormat(DateTimeFormat.hourMinute, locale).format(time),
      ),
    );
  }

  void _showDatePicker(BuildContext context, DateTime initialDate) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: AriesColor.neutral0,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                _onScrollStart();
              } else if (notification is ScrollEndNotification) {
                _onScrollEnd(initialDate, true);
              }
              return true;
            },
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: initialDate,
              onDateTimeChanged: (DateTime newDate) {
                initialDate = newDate;
              },
            ),
          ),
        );
      },
    );
  }

  void _showTimePicker(BuildContext context, DateTime initialTime) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: AriesColor.neutral0,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                _onScrollStart();
              } else if (notification is ScrollEndNotification) {
                _onScrollEnd(initialTime, false);
              }
              return true;
            },
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              use24hFormat: true,
              initialDateTime: initialTime,
              onDateTimeChanged: (DateTime newTime) {
                initialTime = newTime;
              },
            ),
          ),
        );
      },
    );
  }
}
