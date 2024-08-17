import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../helpers.dart';

final getCurrentWeekProvider = Provider<List<DateTime>>((ref) {
  return getCurrentWeekDates();
});

final getCurrentMonthProvider = Provider<String>(
  (ref) {
    final DateTime now = DateTime.now();
    return DateFormat('MMMM').format(now);
  },
);
