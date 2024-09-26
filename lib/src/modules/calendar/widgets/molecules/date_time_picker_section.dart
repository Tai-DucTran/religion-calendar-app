import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

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
  @override
  void initState() {
    super.initState();
    _initializeDate();
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

  @override
  Widget build(BuildContext context) {
    final eventDateTime = ref.watch(eventDateTimeControllerProvider);
    final isAllDay = ref.watch(isAllDayToggleControllerProvider);
    final currentLocale = Localizations.localeOf(context).toString();

    final date =
        widget.isStartDate ? eventDateTime.startDate : eventDateTime.endDate;
    final time =
        widget.isStartDate ? eventDateTime.startTime : eventDateTime.endTime;

    return ListTile(
      isThreeLine: true,
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Padding(
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
      ),
      title: CupertinoButton(
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        onPressed: () => _showDatePicker(context, date),
        child: Text(
          DateFormat(DateTimeFormat.dateShortMonthYear, currentLocale)
              .format(date),
        ),
      ),
      subtitle: DateSubtitlePicker(
        locale: currentLocale,
        selectedDate: date,
      ),
      trailing: !isAllDay
          ? CupertinoButton(
              padding: const EdgeInsets.only(bottom: 0),
              onPressed: () => _showTimePicker(context, time),
              child: Text(
                DateFormat(DateTimeFormat.hourMinute, currentLocale)
                    .format(time!),
              ),
            )
          : const Offstage(),
    );
  }

  void _showDatePicker(BuildContext context, DateTime initialDate) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: AriesColor.neutral0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: initialDate,
            onDateTimeChanged: (DateTime newDate) {
              if (widget.isStartDate) {
                ref
                    .read(eventDateTimeControllerProvider.notifier)
                    .setStartDate(newDate);
              } else {
                ref
                    .read(eventDateTimeControllerProvider.notifier)
                    .setEndDate(newDate);
              }
            },
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
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            use24hFormat: true,
            initialDateTime: initialTime,
            onDateTimeChanged: (DateTime newTime) {
              if (widget.isStartDate) {
                ref
                    .read(eventDateTimeControllerProvider.notifier)
                    .setStartTime(newTime);
              } else {
                ref
                    .read(eventDateTimeControllerProvider.notifier)
                    .setEndTime(newTime);
              }
            },
          ),
        );
      },
    );
  }
}
