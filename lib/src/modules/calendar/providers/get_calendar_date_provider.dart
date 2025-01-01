import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/helpers.dart';

final getCurrentWeekProvider = Provider<List<DateTime>>((ref) {
  return getCurrentWeekDates();
});
