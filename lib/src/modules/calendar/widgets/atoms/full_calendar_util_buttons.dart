import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class FullCalendarUtilButtons extends ConsumerWidget {
  const FullCalendarUtilButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () =>
              ref.read(fullCalendarControllerProvider.notifier).goToToday(),
          child: const Text('Today'),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
          ),
        ),
        IconButton(
          onPressed: () async {
            final selectedDate = ref.read(selectedDateProvider);
            final result = await EventDetailModalBottomSheet.show(
              context,
              selectedDate: selectedDate,
            );

            if (!result) return;
          },
          icon: const Icon(
            Icons.add,
          ),
        )
      ],
    );
  }
}
