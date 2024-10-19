import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';

class IsLunarCalendarToggle extends ConsumerWidget {
  const IsLunarCalendarToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLunarCalendar =
        ref.watch(calendarCategoryControllerProvider) == CalendarCategory.lunar;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${LocalizedKeys.calendarCategoryLunarText}?',
          style: AriesTextStyles.textBodyMedium.copyWith(
            fontSize: 12,
          ),
        ),
        Spacing.sp8,
        SizedBox(
          width: 36,
          child: FittedBox(
            child: Switch(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: isLunarCalendar,
              onChanged: (value) => ref
                  .read(calendarCategoryControllerProvider.notifier)
                  .toggleCategory(),
              inactiveTrackColor: AriesColor.neutral0,
              activeTrackColor: AriesColor.yellowP100,
              activeColor: AriesColor.yellowP600,
            ),
          ),
        ),
      ],
    );
  }
}
