import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class FullCalendarEventCard extends ConsumerWidget {
  const FullCalendarEventCard({
    super.key,
    required this.eventName,
    required this.eventTime,
    required this.eventLocation,
    this.eventCategory,
  });

  final String eventName;
  final DateTime? eventTime;
  final String? eventLocation;
  final EventCategory? eventCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isReligionEvent = eventCategory == EventCategory.religionEvent;
    final isSpecialEvent = eventCategory == EventCategory.specialEvent;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        16.w,
        0,
        16.w,
        16.w,
      ),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: isReligionEvent
              ? AriesColor.yellowP50
              : isSpecialEvent
                  ? AriesColor.success50
                  : Color(0xffEAEFFD),
          borderRadius: BorderRadius.circular(8.r),
          border: Border(
            left: BorderSide(
              color: isReligionEvent
                  ? AriesColor.yellowP500
                  : isSpecialEvent
                      ? AriesColor.success200
                      : Color(0xff614EEE),
              width: 2.w,
            ),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.sp4,
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.w,
                horizontal: 16.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: AriesTextStyles.textHeading5.copyWith(
                      color: AriesColor.neutral900,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        eventTime == null || isReligionEvent
                            ? LocalizedKeys.allDayText
                            : DateFormat('HH:mm').format(eventTime!),
                        style: AriesTextStyles.textBodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (!isReligionEvent &&
                          eventLocation != null &&
                          eventLocation != '')
                        Expanded(
                          child: Text(
                            ' - ${eventLocation!}',
                            style: AriesTextStyles.textBodySmall,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                isReligionEvent
                    ? AriesImages.defaultCatholicismEvent1
                    : isSpecialEvent
                        ? AriesImages.defaultChristmasEvent
                        : AriesImages.defaultFamilyEvent1,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
