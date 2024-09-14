import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/src/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class DateTimePickerSection extends ConsumerStatefulWidget {
  const DateTimePickerSection({
    super.key,
    required this.label,
    required this.initialTime,
    required this.initialDate,
    required this.onDateSelect,
    required this.onTimeSelect,
  });

  final String label;
  final DateTime initialTime;
  final DateTime? initialDate;
  final Function(DateTime) onDateSelect;
  final Function(DateTime) onTimeSelect;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DateTimePickerSectionState();
}

class _DateTimePickerSectionState extends ConsumerState<DateTimePickerSection> {
  late DateTime selectedDate;
  late DateTime selectedTime;

  @override
  void initState() {
    super.initState();

    final DateTime initialDate = widget.initialDate ??
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        );
    selectedDate = initialDate;
    selectedTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    final String currentLocale = Localizations.localeOf(context).toString();
    final isAllDay = ref.watch(isAllDayToggleControllerProvider);

    return ListTile(
      isThreeLine: true,
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
          ),
          width: 85.w,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AriesColor.neutral50,
            ),
          ),
          child: Text(
            widget.label,
          ),
        ),
      ),
      title: CupertinoButton(
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250.h,
                  color: AriesColor.neutral0,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    backgroundColor: AriesColor.neutral0,
                    initialDateTime: selectedDate,
                    onDateTimeChanged: (DateTime newDate) {
                      setState(
                        () {
                          selectedDate = newDate;
                          widget.onDateSelect(selectedDate);
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        child: Text(
          DateFormat(
            DateTimeFormat.dateShortMonthYear,
          ).format(
            selectedDate,
          ),
        ),
      ),
      subtitle: DateSubtitlePicker(
        locale: currentLocale,
        selectedDate: selectedDate,
      ),
      trailing: !isAllDay
          ? CupertinoButton(
              padding: const EdgeInsets.only(bottom: 0),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250.h,
                        color: AriesColor.neutral0,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.time,
                          backgroundColor: AriesColor.neutral0,
                          use24hFormat: true,
                          initialDateTime: selectedTime,
                          onDateTimeChanged: (DateTime newTime) {
                            setState(() {
                              selectedTime = newTime;
                              widget.onTimeSelect(selectedTime);
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                DateFormat(
                  DateTimeFormat.hourMinute,
                  currentLocale,
                ).format(
                  selectedTime,
                ),
              ),
            )
          : const Offstage(),
    );
  }
}
