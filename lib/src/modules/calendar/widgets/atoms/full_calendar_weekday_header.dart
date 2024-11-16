import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/utils/helpers.dart';

class FullCalendarWeekdayHeader extends StatelessWidget {
  const FullCalendarWeekdayHeader({
    super.key,
    required this.currentLocale,
  });

  final String currentLocale;

  @override
  Widget build(BuildContext context) {
    final weekDayNames = getWeekDayNames(
      locale: currentLocale,
      isShortName: true,
    );
    return Padding(
      padding: EdgeInsets.only(
        right: 16.w,
        left: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: weekDayNames
            .map(
              (day) => SizedBox(
                child: Center(
                  child: Text(
                    day,
                    style: AriesTextStyles.textBodyMedium.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
