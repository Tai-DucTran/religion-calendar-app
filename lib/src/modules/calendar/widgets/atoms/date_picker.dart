import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/constants/constants.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.initialDateTime,
    required this.pickerMode,
    required this.onDateTimeSelect,
    required this.dateTimeFormat,
  });

  final DateTime initialDateTime;
  final CupertinoDatePickerMode pickerMode;
  final Function(DateTime) onDateTimeSelect;
  final DateTimeFormat dateTimeFormat;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
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
                  mode: CupertinoDatePickerMode.date,
                  backgroundColor: AriesColor.neutral0,
                  initialDateTime: widget.initialDateTime,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(
                      () {
                        widget.onDateTimeSelect(newDate);
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
          DateTime.timestamp(),
        ),
      ),
    );
  }
}
