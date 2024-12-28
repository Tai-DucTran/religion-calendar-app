import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/controllers.dart';

class ChangeMonthButtonActions extends ConsumerWidget {
  const ChangeMonthButtonActions({
    super.key,
  });

  void onPreviousMonth(PageController controller) {
    controller.previousPage(
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  void onNextMonth(PageController controller) {
    controller.nextPage(
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(fullCalendarControllerProvider);

    return Wrap(
      direction: Axis.horizontal,
      children: [
        IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: AriesColor.yellowP950,
          ),
          onPressed: () {
            onPreviousMonth(pageController);
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.chevron_right,
            color: AriesColor.yellowP950,
          ),
          onPressed: () {
            onNextMonth(pageController);
          },
        ),
      ],
    );
  }
}
