import 'package:flutter/material.dart';
import 'package:aries/aries.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class EventCategoryText extends StatelessWidget {
  const EventCategoryText({
    super.key,
    required this.eventCategory,
  });

  final EventCategory eventCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IntrinsicWidth(
          child: Container(
            constraints: BoxConstraints(
              minWidth: 0,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 3.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AriesColor.neutral50,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: [
                EventCategoryDot(
                  eventCategory: eventCategory,
                ),
                Spacing.sp4,
                Text(
                  eventCategory.localized,
                  maxLines: null,
                  style: AriesTextStyles.textBodySmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
