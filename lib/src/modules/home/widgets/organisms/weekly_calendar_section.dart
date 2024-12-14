import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';

class WeeklyCalendarSection extends ConsumerWidget {
  const WeeklyCalendarSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context).toString();
    final currentWeekDates = ref.watch(getCurrentWeekProvider);
    final currentMonthText = getCurrentSolarMonthText(
      locale: locale,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentMonthText,
              style: AriesTextStyles.textHeading5,
            ),
            IconButton(
              visualDensity: const VisualDensity(
                horizontal: -2,
                vertical: -2,
              ),
              padding: EdgeInsets.zero,
              onPressed: () async {
                final result = await FullCalendarModalBottomSheet.show(context);
                if (!result) {
                  ref.read(displayedMonthProvider.notifier).state =
                      DateTime.now();
                  return;
                }
              },
              icon: Icon(
                Icons.arrow_drop_down_rounded,
                size: 30.h,
                color: AriesColor.yellowP950,
              ),
            )
          ],
        ),
        SizedBox(height: 8.sp),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Wrap(
            children: currentWeekDates.map(
              (date) {
                return DateSection(
                  inputDate: date,
                  isToday: isDateToday(date),
                  isNotInCurrentMonth: !isDateInCurrentMonth(date),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
