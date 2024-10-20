import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/helper/string_helper.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.eventCategory,
    this.religionPreferences,
    this.eventImageUrl,
    this.eventLocation,
  });

  final String? eventImageUrl;
  final String eventName;
  final DateTime eventDate;
  final EventCategory eventCategory;
  final String? eventTime;
  final String? eventLocation;
  final ReligionPreference? religionPreferences;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final String currentLocale = Localizations.localeOf(context).toString();
    final countDownFromNow = eventDate.difference(now).inDays;
    final solarDate = getFullSolarDateText(
      inputDate: eventDate,
      locale: currentLocale,
    );
    final lunarDate = getFullLunarDateText(
      inputDate: eventDate,
      locale: currentLocale,
      dateFormat: 'dd, MMMM',
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
                  color: AriesColor.neutral300,
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
              boxShadow: [
                BoxShadow(
                  color: AriesColor.yellowP600.withOpacity(0.1),
                  offset: const Offset(0, 2),
                  blurRadius: 13.4,
                ),
              ],
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
                        maxLines: 2,
                      ),
                      Spacing.sp4,
                      if (eventTime != null || eventLocation != null) ...[
                        Text(
                          joinTwoString(
                                firstString: eventTime,
                                secondString: eventLocation,
                                separator: ' - ',
                              ) ??
                              '',
                          maxLines: 2,
                        ),
                      ],
                      Spacing.sp4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Icon(
                                Icons.access_time_outlined,
                                color: AriesColor.yellowP500,
                                size: 18,
                              ),
                              Spacing.sp4,
                              Text(
                                isToday
                                    ? LocalizedKeys.todayText
                                    : joinTwoString(
                                          firstString:
                                              countDownFromNow.toString(),
                                          secondString:
                                              LocalizedKeys.daysLeftText,
                                        ) ??
                                        '',
                                style: AriesTextStyles.textBodySmall.copyWith(
                                  fontSize: 12.sp,
                                  color: AriesColor.yellowP500,
                                ),
                              ),
                            ],
                          ),
                        ],
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
