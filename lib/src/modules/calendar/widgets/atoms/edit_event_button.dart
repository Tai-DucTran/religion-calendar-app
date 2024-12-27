import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class EditEventButton extends StatelessWidget {
  const EditEventButton({
    super.key,
    required this.eventId,
  });

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.w,
      right: 16.w,
      child: GestureDetector(
        onTap: () async {
          final result = await EventDetailModalBottomSheet.show(
            context,
            eventId: eventId,
          );
          if (!result) return;
        },
        child: Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            color: AriesColor.yellowP950.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.edit_outlined,
            color: AriesColor.neutral0,
            size: 20.w,
          ),
        ),
      ),
    );
  }
}
