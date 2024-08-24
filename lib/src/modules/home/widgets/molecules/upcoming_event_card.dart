import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.eventTimeCountDown,
    this.eventImageUrl,
    this.eventLocation,
  });

  final String? eventImageUrl;
  final String eventName;
  final DateTime eventDate;
  final String eventTime;
  final String? eventLocation;
  final int eventTimeCountDown;

  @override
  Widget build(BuildContext context) {
    final String currentLocale = Localizations.localeOf(context).toString();
    final solarDate = getFullSolarDateText(
      inputDate: eventDate,
      isIncludingWeekdayName: true,
      locale: currentLocale,
    );
    final lunarDate = getFullLunarDateText(
      inputDate: eventDate,
      locale: currentLocale,
    );
    final isToday = isDateToday(eventDate);

    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                solarDate,
                style: AriesTextStyles.textBodySmall,
              ),
              Text(
                lunarDate,
                style: AriesTextStyles.textBodySmall.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Spacing.sp8,
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AriesColor.neutral0,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 96.h,
                    maxWidth: 80.w,
                  ),
                  child: SvgPicture.asset(
                    eventImageUrl ?? AriesImages.defaultEventImage,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventName,
                        style: AriesTextStyles.textHeading6,
                      ),
                      Spacing.sp4,
                      Row(
                        children: [
                          Text(eventTime),
                          if (eventLocation != null) ...[
                            const Text(' - '),
                            Text(eventLocation!),
                          ]
                        ],
                      ),
                      Spacing.sp4,
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_outlined,
                            color: AriesColor.yellowP500,
                            size: 16,
                          ),
                          Spacing.sp4,
                          Text(
                            isToday ? 'Today' : '$eventTimeCountDown days left',
                            style: AriesTextStyles.textBodySmall.copyWith(
                              fontSize: 12.sp,
                              color: AriesColor.yellowP500,
                            ),
                          ),
                        ],
                      ),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.circle,
                            ),
                            Icon(
                              Icons.circle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
