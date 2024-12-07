import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

// Provider to manage the displayed month
final displayedMonthProvider = StateProvider<DateTime>((ref) => DateTime.now());
