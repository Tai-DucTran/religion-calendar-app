import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/router/routes.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class WeeklyCalendarSection extends ConsumerWidget {
  const WeeklyCalendarSection({super.key});

  String getGreetingText() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return LocalizedKeys.goodMorningText;
    } else if (hour >= 12 && hour < 18) {
      return LocalizedKeys.goodAfternoonText;
    } else {
      return LocalizedKeys.goodEveningText;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeekDates = ref.watch(getCurrentWeekProvider);
    final combineEventsAsync = ref.watch(combineEventsControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getGreetingText(),
              style: AriesTextStyles.textHeading4,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              onPressed: () async {
                context.push(
                  FullCalendarRoute().location,
                );
              },
              child: Text(
                LocalizedKeys.watchFullCalendarText,
                style: AriesTextStyles.textBodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AriesColor.yellowP950,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.sp),
        FullCalendarWeekdayHeader(),
        combineEventsAsync.when(
          loading: () => _LoadingSkeleton(),
          error: (err, stack) => const Offstage(),
          data: (data) {
            final markedDatesMap = ref
                .watch(combineEventsControllerProvider.notifier)
                .getMarkedDateWithColors();

            return SizedBox(
              height: 60.h,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.8,
                ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  final date = currentWeekDates[index];
                  final hasMarker = markedDatesMap.containsKey(date);
                  final colorOfDate = markedDatesMap[date];

                  return FullCalendarDataCell(
                    date: date,
                    hasMarker: hasMarker,
                    listMarkerColor: colorOfDate ?? [],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _LoadingSkeleton extends StatelessWidget {
  const _LoadingSkeleton();

  static final now = DateTime.now();
  static final mockLoadingDate = DateTime(now.year, now.month, now.day + 1);

  @override
  Widget build(BuildContext context) {
    return DefaultSkeleton(
      child: SizedBox(
        height: 60.h,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 0.8,
          ),
          itemCount: 7,
          itemBuilder: (context, index) {
            final hasMarker = false;
            return FullCalendarDataCell(
              date: mockLoadingDate,
              hasMarker: hasMarker,
              listMarkerColor: [],
            );
          },
        ),
      ),
    );
  }
}
