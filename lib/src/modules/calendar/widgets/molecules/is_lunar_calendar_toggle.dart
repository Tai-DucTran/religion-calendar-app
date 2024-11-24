import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AriesIcons.moon01Icon,
              width: 16.w,
              height: 16.h,
              color: AriesColor.neutral100,
            ),
            Spacing.sp8,
            Text(
              '${LocalizedKeys.calendarCategoryLunarText}?',
              style: AriesTextStyles.textBodySmall,
            ),
          ],
        ),
        SizedBox(
          width: 36.w,
          child: FittedBox(
            child: CupertinoSwitch(
              value: isLunarCalendar,
              onChanged: (value) => ref
                  .read(calendarCategoryControllerProvider.notifier)
                  .toggleCategory(),
              activeColor: AriesColor.yellowP200,
            ),
          ),
        ),
      ],
    );
  }
}
