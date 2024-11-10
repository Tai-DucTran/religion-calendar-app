import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

// class IsAllDayToggle extends ConsumerWidget {
//   const IsAllDayToggle({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isAllDay = ref.watch(isAllDayToggleControllerProvider);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           LocalizedKeys.allDayToggleText,
//           style: AriesTextStyles.textBodySmall,
//         ),
//         Spacing.sp8,
//         SizedBox(
//           width: 36.w,
//           child: FittedBox(
//             child: CupertinoSwitch(
//               value: isAllDay,
//               onChanged: (value) {
//                 final provider =
//                     ref.read(isAllDayToggleControllerProvider.notifier);
//                 provider.toggle();
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class IsAllDayToggle extends ConsumerWidget {
  const IsAllDayToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAllDay = ref.watch(isAllDayToggleControllerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.access_time_outlined,
          color: AriesColor.neutral100,
        ),
        Spacing.sp8,
        Text(
          LocalizedKeys.allDayToggleText,
          style: AriesTextStyles.textBodySmall,
        ),
        const Spacer(),
        SizedBox(
          width: 36.w,
          child: FittedBox(
            child: CupertinoSwitch(
              value: isAllDay,
              onChanged: (value) {
                final provider =
                    ref.read(isAllDayToggleControllerProvider.notifier);
                provider.toggle();
              },
              activeColor: AriesColor.yellowP200,
            ),
          ),
        ),
      ],
    );
  }
}
