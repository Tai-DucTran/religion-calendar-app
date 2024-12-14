import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/constants/date_time_format.dart';
import 'package:religion_calendar_app/src/modules/calendar/providers/full_calendar_provider.dart';
import 'package:religion_calendar_app/src/utils/string_helper.dart';

class FullMonthCalendarHeader extends ConsumerWidget {
  const FullMonthCalendarHeader({
    super.key,
    required this.controller,
    required this.currentLocale,
  });

  final String currentLocale;
  final PageController controller;

  void onPreviousMonth() {
    controller.previousPage(
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  void onNextMonth() {
    controller.nextPage(
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayedMonth = ref.watch(displayedMonthProvider);

    return Padding(
      padding: EdgeInsets.only(
        right: 16.w,
        left: 16.w,
        top: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat(
              DateTimeFormat.monthYear,
              currentLocale,
            )
                .format(
                  displayedMonth,
                )
                .toCapitalized(),
            style: AriesTextStyles.textHeading5,
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: AriesColor.yellowP950,
                ),
                onPressed: onPreviousMonth,
              ),
              IconButton(
                icon: const Icon(
                  Icons.chevron_right,
                  color: AriesColor.yellowP950,
                ),
                onPressed: onNextMonth,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
