import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class EventCategoryDot extends StatelessWidget {
  const EventCategoryDot({
    super.key,
    required this.eventCategory,
  });

  final EventCategory eventCategory;

  static const _categoryColors = {
    EventCategory.religionEvent: AriesColor.yellowP300,
    EventCategory.specialEvent: AriesColor.success200,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: 6.w,
        height: 6.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.r),
          color: _categoryColors[eventCategory] ?? const Color(0xFF6F66FF),
        ),
      ),
    );
  }
}
