import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/calendar/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_calendar_controller.g.dart';

@riverpod
class FullCalendarController extends _$FullCalendarController {
  static const int initialPage = 1000;

  @override
  PageController build() {
    final controller = PageController(initialPage: initialPage);

    ref.onDispose(() {
      controller.dispose();
    });

    return controller;
  }

  void goToToday() {
    state.animateToPage(
      initialPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int page) {
    final monthDiff = page - initialPage;
    final currentMonth = DateTime(
      DateTime.now().year,
      DateTime.now().month + monthDiff,
    );
    ref.read(displayedMonthProvider.notifier).state = currentMonth;
  }
}
