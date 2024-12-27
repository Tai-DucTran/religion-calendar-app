import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_calender/enums/time_zone.dart';
import 'package:full_calender/full_calender.dart';
import 'package:religion_calendar_app/constants/date_time_format.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class FullCalendarDataCell extends StatelessWidget {
  const FullCalendarDataCell({
    super.key,
    required this.date,
    required this.isSelected,
    required this.isToday,
    required this.hasMarker,
    required this.onTap,
    required this.listMarkerColor,
    this.markerBuilder,
  });

  final DateTime date;
  final bool isSelected;
  final bool isToday;
  final bool hasMarker;
  final VoidCallback onTap;
  final List<Color> listMarkerColor;
  final Widget Function(
    DateTime date,
    Color color,
  )? markerBuilder;

  @override
  Widget build(BuildContext context) {
    final String currentLocale = Localizations.localeOf(context).toString();
    final lunarDate = FullCalender(
      date: date,
      timeZone: TimeZone.vietnamese.timezone,
    ).lunarDate;
    final isImportance = isImportantDay(lunarDate);
    final formattedLunarDateText = LunarDateFormatter.format(
      lunarDate,
      isImportance ? DateTimeFormat.dayMonth : DateTimeFormat.day,
      currentLocale,
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isToday
              ? AriesColor.yellowP100
              : isSelected
                  ? AriesColor.yellowP200
                  : Colors.transparent,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
            bottom: Radius.circular(4.r),
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 4,
              child: Text(
                date.day.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.black : AriesColor.neutral800,
                  fontWeight: isSelected || isToday
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              child: Text(
                formattedLunarDateText.toString(),
                style: AriesTextStyles.textBodySmall.copyWith(
                  fontSize: 12,
                  color: isImportance
                      ? isSelected
                          ? AriesColor.danger300
                          : AriesColor.danger100
                      : AriesColor.neutral100,
                ),
              ),
            ),
            if (hasMarker && markerBuilder == null)
              Positioned(
                bottom: 6,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listMarkerColor.isEmpty
                      ? [
                          SizedBox(
                            width: 4.w,
                            height: 4.w,
                          )
                        ]
                      : listMarkerColor
                          .map(
                            (color) => Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1.w,
                              ),
                              child: Container(
                                width: 4.w,
                                height: 4.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.r),
                                  color: color,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
