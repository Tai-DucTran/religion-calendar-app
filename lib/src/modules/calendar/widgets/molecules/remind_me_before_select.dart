import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';

class RemindMeBeforeSelect extends ConsumerWidget {
  const RemindMeBeforeSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = RemindMeBeforeOptions.values.toList();
    const selectedOption = RemindMeBeforeOptions.atTime;
    final TextStyle textStyle = AriesTextStyles.textBodySmall;
    
    return Row(
      children: [
        const Icon(
          CupertinoIcons.bell,
          color: AriesColor.neutral100,
        ),
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
                AriesColor.neutral0,
            style: textStyle.copyWith(
              color: AriesColor.black,
            ),
          ),
        ),
      ],
    );
  }
}
