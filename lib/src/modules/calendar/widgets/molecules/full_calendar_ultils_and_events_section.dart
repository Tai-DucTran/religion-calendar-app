import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class FullCalendarUltilsAndEventsSection extends ConsumerWidget {
  const FullCalendarUltilsAndEventsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _HeightAdjustedSection(
      child: _EventSectionContent(),
    );
  }
}

class _HeightAdjustedSection extends ConsumerWidget {
  const _HeightAdjustedSection({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMonth = ref.watch(displayedMonthProvider);
    final heightFactor = ref.watch(calendarLayoutProvider(currentMonth));
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * heightFactor,
      child: child,
    );
  }
}

class _EventSectionContent extends StatelessWidget {
  const _EventSectionContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          color: AriesColor.neutral30,
        ),
        Spacing.sp8,
        const FullCalendarUtilButtons(),
        Spacing.sp8,
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const FullCalendarEventCard(
                  eventName: 'Lễ ngày Chúa nhật',
                  eventTime: null,
                  eventCategory: EventCategory.religionEvent,
                ),
                const FullCalendarEventCard(
                  eventName: 'Sự kiện này rất rất dài và là một sự kiện mẫu',
                  eventTime: null,
                  eventCategory: EventCategory.personalEvent,
                ),
                FullCalendarEventCard(
                  eventName: 'Đám giỗ ông A',
                  eventTime: DateTime.now(),
                  eventCategory: EventCategory.personalEvent,
                ),
                FullCalendarEventCard(
                  eventName: 'Sự kiện này rất rất dài và là một sự kiện mẫu',
                  eventTime: DateTime.now(),
                  eventCategory: EventCategory.religionEvent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
