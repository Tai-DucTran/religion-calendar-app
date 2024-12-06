import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class EventDescriptionText extends StatelessWidget {
  const EventDescriptionText({
    super.key,
    required this.event,
  });

  final BasedEvent event;

  @override
  Widget build(BuildContext context) {
    final description = event.description ?? '';

    return Column(
      children: [
        Spacing.sp20,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!(event.eventCategory == EventCategory.religionEvent))
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.wrap_text,
                    color: AriesColor.neutral70,
                    size: 20.h,
                  ),
                  Spacing.sp8,
                ],
              ),
            Expanded(
              child: Text(
                description,
                overflow: TextOverflow.visible,
                style: AriesTextStyles.textBodyNormal.copyWith(
                  color: AriesColor.neutral700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
