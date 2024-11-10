import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';

// class RemindMeBeforeSelect extends ConsumerWidget {
//   const RemindMeBeforeSelect({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final options = RemindMeBeforeOptions.values.toList();
//     const selectedOption = RemindMeBeforeOptions.atTime;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           LocalizedKeys.eventRemindMeBefore,
//           style: AriesTextStyles.textHeading6,
//         ),
//         Spacing.sp8,
//         IntrinsicWidth(
//           child: DropdownButton<RemindMeBeforeOptions>(
//             items: options.map(
//               (option) {
//                 final isSelectedOption = option == selectedOption;
//                 return DropdownMenuItem(
//                   value: option,
//                   child: Row(children: [
//                     Text(
//                       option.localized,
//                       style: AriesTextStyles.textHeading6.copyWith(
//                         color: isSelectedOption
//                             ? AriesColor.yellowP300
//                             : AriesColor.black,
//                         fontWeight: isSelectedOption
//                             ? FontWeight.bold
//                             : FontWeight.w400,
//                       ),
//                     ),
//                   ]),
//                 );
//               },
//             ).toList(),
//             onChanged: (newValue) {},
//             value: selectedOption,
//             underline: const SizedBox.shrink(),
//             borderRadius: BorderRadius.circular(
//               8.r,
//             ),
//             dropdownColor: AriesColor.neutral0,
//             isExpanded: false,
//           ),
//         )
//       ],
//     );
//   }
// }

class RemindMeBeforeSelect extends ConsumerWidget {
  const RemindMeBeforeSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = RemindMeBeforeOptions.values.toList();
    const selectedOption = RemindMeBeforeOptions.atTime;
    return Row(
      children: [
        const Icon(CupertinoIcons.bell, color: AriesColor.neutral100),
        Spacing.sp8,
        Flexible(
          child: DropdownButtonFormField<RemindMeBeforeOptions>(
            value: selectedOption,
            items: options.map(
              (option) {
                return DropdownMenuItem(
                  value: option,
                  child: Row(children: [
                    Text(
                      option.localized,
                    ),
                  ]),
                );
              },
            ).toList(),
            onChanged: (newValue) {},
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            dropdownColor:
                Colors.white, // Background color of the dropdown menu
            style: const TextStyle(
                fontWeight: FontWeight.normal, // Set the font weight to normal
                color: Colors.black),
          ),
        ),
      ],
    );
  }
}