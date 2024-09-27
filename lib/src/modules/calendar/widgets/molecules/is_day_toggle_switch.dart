import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class IsAllDayToggleSwitch extends ConsumerWidget {
  const IsAllDayToggleSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAllDay = ref.watch(isAllDayToggleControllerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocalizedKeys.allDayToggleText,
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
              value: isAllDay,
              onChanged: (value) {
                final provider =
                    ref.read(isAllDayToggleControllerProvider.notifier);
                provider.toggle();
              },
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
