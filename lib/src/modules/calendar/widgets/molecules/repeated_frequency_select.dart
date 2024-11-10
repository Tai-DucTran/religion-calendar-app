import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';

// class RepeatedFrequencySelect extends ConsumerWidget {
//   const RepeatedFrequencySelect({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final options = RepeatedFrequency.values.toList();
//     const selectedFrequency = RepeatedFrequency.doesNotRepeat;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Spacing.sp8,
//         IntrinsicWidth(
//           child: DropdownButton<RepeatedFrequency>(
//             items: options.map(
//               (option) {
//                 final isSelectedOption = option == selectedFrequency;
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
//             value: selectedFrequency,
//             underline: const SizedBox.shrink(),
//             borderRadius: BorderRadius.circular(
//               8.r,
//             ),
//             dropdownColor: AriesColor.neutral0,
//             isExpanded: true,
//           ),
//         )
//       ],
//     );
//   }
// }

class RepeatedFrequencySelect extends ConsumerWidget {
  const RepeatedFrequencySelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = RepeatedFrequency.values.toList();
    const selectedFrequency = RepeatedFrequency.doesNotRepeat;
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          color: AriesColor.neutral0,
          border: Border.all(
            color: AriesColor.neutral50,
          ),
          borderRadius: BorderRadiusDirectional.circular(
            8.r,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 4.h,
        ),
        child: Center(
          child: DropdownButton<RepeatedFrequency>(
            items: options.map(
              (option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(
                    option.localized,
                    style: AriesTextStyles.textBodySmall,
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) {},
            value: selectedFrequency,
            underline: const SizedBox.shrink(),
            borderRadius: BorderRadius.circular(
              8.r,
            ),
            dropdownColor: AriesColor.neutral0,
            isExpanded: true,
            isDense: true,
          ),
        ),
      ),
    );
  }
}