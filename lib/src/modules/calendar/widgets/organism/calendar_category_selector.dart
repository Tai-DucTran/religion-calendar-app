import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/molecules/molecules.dart';

class CalendarCategorySelector extends ConsumerWidget {
  const CalendarCategorySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCalendar = ref.watch(calendarCategoryControllerProvider);

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SelectedCalendarCategoryButton(
            isSelected: selectedCalendar == CalendarCategory.solar,
            icon: Icons.wb_sunny_outlined,
            label: CalendarCategory.solar.localized,
            onPressed: () {
              ref
                  .read(calendarCategoryControllerProvider.notifier)
                  .setCategory(CalendarCategory.solar);
            },
          ),
          const SizedBox(width: 20),
          SelectedCalendarCategoryButton(
            isSelected: selectedCalendar == CalendarCategory.lunar,
            icon: Icons.nightlight_outlined,
            label: CalendarCategory.lunar.localized,
            onPressed: () {
              ref
                  .read(calendarCategoryControllerProvider.notifier)
                  .setCategory(CalendarCategory.lunar);
            },
          ),
        ],
      ),
    );
  }
}
