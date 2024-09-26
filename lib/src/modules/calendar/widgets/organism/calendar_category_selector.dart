import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';

///* Keep the name like this for scalable purpose because in the feature
/// We might want to add more type of [CalendarCategory]
class CalendarCategorySelector extends ConsumerWidget {
  const CalendarCategorySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLunarCalendar =
        ref.watch(calendarCategoryControllerProvider) == CalendarCategory.lunar;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${LocalizedKeys.calendarTypeLunarText}?',
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
