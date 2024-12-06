import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class EditEventButton extends StatelessWidget {
  const EditEventButton({
    super.key,
    required this.event,
  });

  final BasedEvent event;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.w,
      right: 16.w,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Icon(
            Icons.edit,
            color: AriesColor.neutral0,
            size: 24,
          ),
        ),
      ),
    );
  }
}
