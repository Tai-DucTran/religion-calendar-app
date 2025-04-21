import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';

class RepeatedFrequencySelect extends ConsumerWidget {
  const RepeatedFrequencySelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = RepeatedFrequency.values.toList();
    final selectedFrequency = ref.watch(repeatedFrequencyControllerProvider);

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
                    option.localized(context),
                    style: AriesTextStyles.textBodySmall,
                  ),
                );
              },
            ).toList(),
            onChanged: (RepeatedFrequency? newValue) {
              final controller =
                  ref.read(repeatedFrequencyControllerProvider.notifier);
              controller.setFrequency(newValue as RepeatedFrequency);
            },
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
