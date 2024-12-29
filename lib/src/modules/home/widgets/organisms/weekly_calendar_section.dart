import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';
import 'package:religion_calendar_app/src/router/routes.dart';
import 'package:religion_calendar_app/src/utils/log.dart';

class WeeklyCalendarSection extends ConsumerWidget {
  const WeeklyCalendarSection({super.key});

  String getGreetingText() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return LocalizedKeys.goodMorningText;
    } else if (hour >= 12 && hour < 18) {
      return LocalizedKeys.goodAfternoonText;
    } else {
      return LocalizedKeys.goodEveningText;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeekDates = ref.watch(getCurrentWeekProvider);
    final markedDatesMap = ref
        .watch(combineEventsControllerProvider.notifier)
        .getMarkedDateWithColors();

    markedDatesMap.log();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getGreetingText(),
              style: AriesTextStyles.textHeading4,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              onPressed: () async {
                context.push(
                  FullCalendarRoute().location,
                );
              },
              child: Text(
                LocalizedKeys.watchFullCalendarText,
                style: AriesTextStyles.textBodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AriesColor.yellowP950,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.sp),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Wrap(
            children: currentWeekDates.map((date) {
              final normalizedDate = DateTime(date.year, date.month, date.day);
              final listMarkerColor = markedDatesMap[normalizedDate] ?? [];

              return DateSection(
                inputDate: date,
                isToday: isDateToday(date),
                isNotInCurrentMonth: !isDateInCurrentMonth(date),
                listMarkerColor: listMarkerColor,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
