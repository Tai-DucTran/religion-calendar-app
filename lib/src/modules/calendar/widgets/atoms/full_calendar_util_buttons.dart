import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class FullCalendarUtilButtons extends ConsumerWidget {
  const FullCalendarUtilButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocalizedKeys.todayEventText,
          style: AriesTextStyles.textHeading6,
        ),
        Row(
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              onPressed: () => {
                ref.read(fullCalendarControllerProvider.notifier).goToToday(),
                ref.read(selectedDateProvider.notifier).state = DateTime.now(),
              },
              child: Text(
                LocalizedKeys.todayText,
                style: AriesTextStyles.textBodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AriesColor.yellowP950,
                ),
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
            ),
          ],
        ),
      ],
    );
  }
}
