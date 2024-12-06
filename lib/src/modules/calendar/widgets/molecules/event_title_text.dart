import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class EventTitleText extends StatelessWidget {
  const EventTitleText({
    super.key,
    required this.event,
  });

  final BasedEvent event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  event.title,
                  overflow: TextOverflow.visible,
                  style: AriesTextStyles.textHeading4.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
