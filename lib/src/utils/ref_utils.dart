import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';

extension RefX<T> on Ref<T> {
  /// Caches the value provided by Future/Stream providers for [duration].
  void cache([Duration duration = const Duration(seconds: 30)]) {
    // Disable cache in test environment as it might cause pending timers to not be canceled.
    final inTest = Platform.environment.containsKey('FLUTTER_TEST');
    if (inTest) return;

    Timer? timer;
    final link = keepAlive();

    // When the provider is destroyed, cancel the timer
    onDispose(() => timer?.cancel());
    // When the last listener is removed, start a timer to dispose the cached data
    onCancel(() => timer = Timer(duration, link.close));
    // If the provider is listened again after it was paused, cancel the timer
    onResume(() => timer?.cancel());

    /// Invalidate all caches when user auth status changes
    listen(
      authStateControllerProvider,
      (_, auth) => auth.whenData((_) => link.close()),
    );
  }
}
