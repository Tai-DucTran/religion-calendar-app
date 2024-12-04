import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets.dart';

class DatePickerModal extends StatelessWidget {
  const DatePickerModal({
    super.key,
    required this.scrollDayController,
    required this.scrollMonthController,
    required this.scrollYearController,
    required this.listDays,
    required this.listMonths,
    required this.listYears,
    required this.onDayChanged,
    required this.onMonthChanged,
    required this.onYearChanged,
    required this.isProgrammaticScroll,
    required this.handleScrollNotification,
  });

  final FixedExtentScrollController scrollDayController;
  final FixedExtentScrollController scrollMonthController;
  final FixedExtentScrollController scrollYearController;
  final List<int> listDays;
  final List<String> listMonths;
  final List<int> listYears;
  final Function(int) onDayChanged;
  final Function(int) onMonthChanged;
  final Function(int) onYearChanged;
  final bool isProgrammaticScroll;
  final bool Function(ScrollNotification) handleScrollNotification;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: AriesColor.neutral0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: NotificationListener<ScrollNotification>(
          onNotification: handleScrollNotification,
          child: Stack(
            children: [
              const SelectedDayHighlightBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomCupertinoPicker(
                        scrollController: scrollDayController,
                        onSelectedItemChanged: onDayChanged,
                        children: listDays
                            .map((day) => Center(
                                  child: Text(day.toString()),
                                ))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomCupertinoPicker(
                        scrollController: scrollMonthController,
                        onSelectedItemChanged: onMonthChanged,
                        children: listMonths
                            .map((month) => Center(
                                  child: Text('tháng $month'),
                                ))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: CustomCupertinoPicker(
                        scrollController: scrollYearController,
                        onSelectedItemChanged: onYearChanged,
                        children: listYears
                            .map((year) => Center(
                                  child: Text(year.toString()),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}