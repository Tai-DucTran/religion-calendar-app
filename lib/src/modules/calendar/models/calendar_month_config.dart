import 'package:flutter/material.dart';

@immutable
class CalendarMonthConfig {
  const CalendarMonthConfig({
    required this.daysInMonth,
    required this.firstWeekday,
    required this.hasSixWeeks,
    required this.year,
    required this.month,
  });

  final int daysInMonth;
  final int firstWeekday;
  final bool hasSixWeeks;
  final int year;
  final int month;
}
