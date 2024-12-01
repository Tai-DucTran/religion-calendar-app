import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/user/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/user/models/religion_prefernce.dart';

class FullCalendarEventCard extends ConsumerWidget {
  const FullCalendarEventCard({
    super.key,
    required this.eventName,
    required this.eventTime,
    this.eventCategory = EventCategory.religionEvent,
  });

  final String eventName;
  final DateTime? eventTime;
  final EventCategory? eventCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isReligionEvent = eventCategory == EventCategory.religionEvent;
    final userInfor = ref.watch(userControllerProvider);
    final religionPreference = userInfor.value?.user?.religionPreference;

    return SizedBox(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(
          16.w,
        ),
        margin: EdgeInsets.only(
          bottom: 12.h,
        ),
        decoration: BoxDecoration(
          color: AriesColor.yellowP50,
          border: const Border(
            bottom: BorderSide(
              color: AriesColor.neutral30,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: AriesColor.yellowP600.withOpacity(
                0.1,
              ),
              offset: const Offset(
                0,
                2,
              ),
              blurRadius: 13.4,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Icon(
                      size: 24.r,
                      isReligionEvent
                          ? religionPreference?.icon
                          : eventCategory?.icon,
                      color: AriesColor.neutral300,
                    ),
                    Container(
                      height: 2.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: isReligionEvent
                            ? const Color.fromARGB(255, 61, 203, 250)
                            : AriesColor.success400,
                      ),
                    ),
                  ],
                ),
                Spacing.sp8,
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 210.w,
                  ),
                  child: Text(
                    eventName,
                    style: AriesTextStyles.textHeading6.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Spacing.sp8,
            Text(
              eventTime == null
                  ? LocalizedKeys.allDayText
                  : DateFormat('HH:mm').format(
                      eventTime!,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
