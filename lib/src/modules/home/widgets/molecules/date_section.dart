import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final String currentLocale = Localizations.localeOf(context).toString();
    final String weekdayName = getWeekdayName(
      inputDate: inputDate,
      locale: currentLocale,
    );
    final String date = DateFormat.d(currentLocale).format(
      inputDate,
    );
    final lunarDate = getFullLunarDateText(
      inputDate: inputDate,
      locale: currentLocale,
      dateFormat: 'dd/MM',
    );

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(4.r),
      child: InkWell(
        onTap: () async {
          final result = await EventDetailModalBottomSheet.show(
            selectedDate: inputDate,
            context,
          );
          if (!result) return;
        },
        borderRadius: BorderRadius.circular(4.r),
        splashColor: AriesColor.yellowP200.withOpacity(
          0.3,
        ),
        child: Column(
          children: [
            Text(
              weekdayName,
              style: AriesTextStyles.textBodyMedium.copyWith(
                color:
                    isNotInCurrentMonth ? Colors.grey : AriesColor.neutral400,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 4.h,
                left: 12.w,
                right: 12.w,
                bottom: 4.h,
              ),
              margin: EdgeInsets.all(
                4.0.h,
              ),
              decoration: BoxDecoration(
                color: isToday ? AriesColor.yellowP100 : Colors.transparent,
                borderRadius: BorderRadius.circular(4.r),
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
                    style: AriesTextStyles.textBodyMedium.copyWith(
                      color: isNotInCurrentMonth ? Colors.grey : Colors.black,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.right,
                    lunarDate,
                    style: AriesTextStyles.textBodyMedium.copyWith(
                      color: isNotInCurrentMonth
                          ? Colors.grey
                          : isToday
                              ? AriesColor.yellowP500
                              : Colors.black,
                      fontSize: 14.sp,
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
