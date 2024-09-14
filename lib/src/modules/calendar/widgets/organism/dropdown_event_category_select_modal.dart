import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/event_category_controller.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';

class DropDownEventCategorySelectModal extends ConsumerWidget {
  const DropDownEventCategorySelectModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = EventCategory.values
        .map(
          (e) => e,
        )
        .toList();

    final selectedCategory = ref.watch(eventCategoryControllerProvider);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 160.w,
        maxWidth: 180.w,
      ),
      child: Container(
        height: 30.h,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(
            8.r,
          ),
        ),
        child: DropdownButton<EventCategory>(
          value: selectedCategory,
          style: AriesTextStyles.textBodySmall.copyWith(
            color: AriesColor.black,
          ),
          padding: EdgeInsets.only(
            bottom: 4.h,
          ),
          icon: Padding(
            padding: EdgeInsets.only(
              top: 4.h,
            ),
            child: const Icon(
              Icons.arrow_drop_down,
            ),
          ),
          enableFeedback: true,
          isExpanded: true,
          underline: const SizedBox.shrink(),
          borderRadius: BorderRadius.circular(8.r),
          dropdownColor: AriesColor.neutral20,
          items: options.map(
            (EventCategory option) {
              return DropdownMenuItem<EventCategory>(
                value: option,
                child: Text(
                  option.localized,
                ),
              );
            },
          ).toList(),
          onChanged: (EventCategory? newValue) {
            final controller =
                ref.read(eventCategoryControllerProvider.notifier);

            controller.setCategory(newValue as EventCategory);
          },
        ),
      ),
    );
  }
}
