import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class CalendarMonthWithAllDays extends ConsumerWidget {
  const CalendarMonthWithAllDays({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthConfig = ref.watch(calendarMonthConfigProvider);
    final markedDatesMap = ref
        .watch(combineEventsControllerProvider.notifier)
        .getMarkedDateWithColors();

    final combineEventsAsync = ref.watch(combineEventsControllerProvider);

    return combineEventsAsync.when(
      error: (err, stack) => const Offstage(),
      loading: () => _LoadingSkeleton(monthConfig: monthConfig),
      data: (data) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 4,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemCount: monthConfig.hasSixWeeks ? 42 : 35,
              itemBuilder: (context, index) {
                final dayOffset = index - (monthConfig.firstWeekday - 1);
                final day = dayOffset + 1;

                if (dayOffset < 0 || day > monthConfig.daysInMonth) {
                  return const SizedBox.shrink();
                }

                final date = DateTime(monthConfig.year, monthConfig.month, day);
                final hasMarker = markedDatesMap.containsKey(date);

                return FullCalendarDataCell(
                  date: date,
                  hasMarker: hasMarker,
                  listMarkerColor: markedDatesMap[date] ?? [],
                );
              },
            );
          },
        );
      },
    );
  }
}

class _LoadingSkeleton extends StatelessWidget {
  const _LoadingSkeleton({
    required this.monthConfig,
  });

  final CalendarMonthConfig monthConfig;

  @override
  Widget build(BuildContext context) {
    return DefaultSkeleton(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            itemCount: monthConfig.hasSixWeeks ? 42 : 35,
            itemBuilder: (context, index) {
              final dayOffset = index - (monthConfig.firstWeekday - 1);
              final day = dayOffset + 1;

              if (dayOffset < 0 || day > monthConfig.daysInMonth) {
                return const SizedBox.shrink();
              }

              final date = DateTime(monthConfig.year, monthConfig.month, day);
              final hasMarker = false;

              return FullCalendarDataCell(
                date: date,
                hasMarker: hasMarker,
                listMarkerColor: [],
              );
            },
          );
        },
      ),
    );
  }
}
