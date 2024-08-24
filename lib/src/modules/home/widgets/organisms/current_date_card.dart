import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';

class CurrentDateCard extends ConsumerWidget {
  const CurrentDateCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(
        16,
      ),
      decoration: BoxDecoration(
        color: AriesColor.yellowP75,
        borderRadius: BorderRadius.circular(
          16.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TodayCalendarSection(),
          Spacing.sp8,
          const DashDivider(
            color: AriesColor.yellowP200,
          ),
          Spacing.sp8,
          const TodayEventQuote()
        ],
      ),
    );
  }
}
