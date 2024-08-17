import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class DateSection extends ConsumerWidget {
  const DateSection({
    required this.inputDate,
    required this.isToday,
    required this.isNotInCurrentMonth,
    super.key,
  });

  final DateTime inputDate;
  final bool isToday;
  final bool isNotInCurrentMonth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String weekdayName = DateFormat('E').format(inputDate);
    final String date = DateFormat('d').format(inputDate);
    final lunarDate = getLunarDate(date: inputDate);

    return Column(
      children: [
        Text(
          weekdayName,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color:
                    isNotInCurrentMonth ? Colors.grey : AriesColor.neutral400,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 4,
            left: 12,
            right: 12,
            bottom: 4,
          ),
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: isToday ? AriesColor.yellowP50 : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: isToday
                ? Border.all(
                    color: AriesColor.yellowP50,
                    width: 0,
                  )
                : null,
          ),
          child: Column(
            children: [
              Text(
                date,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isNotInCurrentMonth ? Colors.grey : Colors.black,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                    ),
              ),
              Text(
                textAlign: TextAlign.right,
                lunarDate,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isNotInCurrentMonth
                          ? Colors.grey
                          : isToday
                              ? AriesColor.yellowP500
                              : Colors.black,
                      fontSize: 10,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
