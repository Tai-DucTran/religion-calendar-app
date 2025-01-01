import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class _CellConstants {
  static final topRadius = Radius.circular(20.r);
  static final bottomRadius = Radius.circular(4.r);
  static final markerSize = 4.w;
  static final markerPadding = EdgeInsets.symmetric(horizontal: 1.w);
  static final markerBorderRadius = BorderRadius.circular(2.r);
}

class FullCalendarDataCell extends ConsumerWidget {
  const FullCalendarDataCell({
    super.key,
    required this.date,
    required this.hasMarker,
    required this.listMarkerColor,
    this.markerBuilder,
  });

  final DateTime date;
  final bool hasMarker;
  final List<Color> listMarkerColor;
  final Widget Function(
    DateTime date,
    Color color,
  )? markerBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final isSelected = date.year == selectedDate.year &&
        date.month == selectedDate.month &&
        date.day == selectedDate.day;

    final isToday = _isToday(date);
    return GestureDetector(
      onTap: () {
        ref.read(selectedDateProvider.notifier).state = date;
      },
      child: Container(
        decoration: BoxDecoration(
          color: isToday
              ? AriesColor.yellowP100
              : isSelected
                  ? AriesColor.yellowP200
                  : Colors.transparent,
          borderRadius: BorderRadius.vertical(
            top: _CellConstants.topRadius,
            bottom: _CellConstants.bottomRadius,
          ),
        ),
        child: Column(
          children: [
            Spacing.sp2,
            Text(
              date.day.toString(),
              style: TextStyle(
                color: isSelected ? Colors.black : AriesColor.neutral800,
                fontWeight:
                    isSelected || isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            LunarDateCellData(
              date: date,
              isSelected: isSelected,
              isToday: isToday,
              key: Key('${date.day}-${date.month}-lunar-section'),
            ),
            if (hasMarker && markerBuilder == null)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: listMarkerColor.isEmpty
                    ? [
                        SizedBox(
                          width: _CellConstants.markerSize,
                          height: _CellConstants.markerSize,
                        )
                      ]
                    : listMarkerColor
                        .map(
                          (color) => Padding(
                            padding: _CellConstants.markerPadding,
                            child: Container(
                              width: _CellConstants.markerSize,
                              height: _CellConstants.markerSize,
                              decoration: BoxDecoration(
                                borderRadius: _CellConstants.markerBorderRadius,
                                color: color,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
          ],
        ),
      ),
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
