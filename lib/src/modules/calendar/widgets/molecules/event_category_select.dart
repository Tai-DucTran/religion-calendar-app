import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class EventCategorySelect extends ConsumerWidget {
  const EventCategorySelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = EventCategory.values.toList();
    final selectedCategory = ref.watch(eventCategoryControllerProvider);

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
          child: DropdownButton<EventCategory>(
            items: options
                .where((option) =>
                    option != EventCategory.religionEvent &&
                    option != EventCategory.specialEvent)
                .map(
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
            onChanged: (EventCategory? newValue) {
              final controller =
                  ref.read(eventCategoryControllerProvider.notifier);
              controller.setCategory(newValue as EventCategory);
            },
            value: selectedCategory,
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
