import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class TodayCalendarSection extends StatelessWidget {
  const TodayCalendarSection({
    super.key,
    this.eventImage,
  });

  final String? eventImage;

  @override
  Widget build(BuildContext context) {
    final currentDate = getCurrentSolarDateText();
    final currentLunarDate = getCurrentLunarDateText();

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: AriesTextStyles.textBodyMedium,
            ),
            Spacing.sp8,
            Text(
              currentDate,
              style: AriesTextStyles.textHeading5,
            ),
            Spacing.sp8,
            Row(
              children: [
                Container(
                  width: 24.sp,
                  height: 24.sp,
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: AriesColor.neutral0,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AriesIcons.moonStartOutlineIcon,
                  ),
                ),
                Spacing.sp8,
                Text(
                  currentLunarDate,
                  style: AriesTextStyles.textBodyNormal,
                ),
              ],
            ),
          ],
        ),
        Spacing.sp8,
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 140.sp,
            ),
            child: SvgPicture.asset(
              eventImage ?? AriesImages.defaultEventImage,
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}
