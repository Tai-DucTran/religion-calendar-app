import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/utils/log.dart';

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

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: () {
          'selecting date card'.log();
        },
        borderRadius: BorderRadius.circular(4),
        splashColor: AriesColor.yellowP200.withOpacity(
          0.3,
        ),
        child: Column(
          children: [
            Text(
              weekdayName,
              style: AriesTextStyles.textBodySmall.copyWith(
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
                    style: AriesTextStyles.textBodySmall.copyWith(
                      color: isNotInCurrentMonth ? Colors.grey : Colors.black,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.right,
                    lunarDate,
                    style: AriesTextStyles.textBodySmall.copyWith(
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
        ),
      ),
    );
  }
}
