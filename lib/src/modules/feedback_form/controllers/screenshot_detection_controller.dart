import 'package:religion_calendar_app/src/modules/feedback_form/controllers/controllers.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:screenshot_callback/screenshot_callback.dart';

part 'screenshot_detection_controller.g.dart';

@Riverpod(keepAlive: true)
class ScreenshotDetectionController extends _$ScreenshotDetectionController {
  late ScreenshotCallback _screenshotCallback;
  bool _isInitialized = false;

  @override
  FutureOr<bool> build() async {
    try {
      _screenshotCallback = ScreenshotCallback();
      _screenshotCallback.addListener(() {
        ref.read(feedbackServiceProvider.notifier).showFeedbackForm();
      });

      _isInitialized = true;
      Log.info('Screenshot detection initialized successfully');

      // Clean up on dispose
      ref.onDispose(() {
        if (_isInitialized) {
          _screenshotCallback.dispose();
        }
      });

      return true;
    } catch (e) {
      Log.error('Failed to initialize screenshot detection: $e');
      return false;
    }
  }

  void manualTriggerToggle() {
    if (_isInitialized) {
      ref.read(feedbackServiceProvider.notifier).showFeedbackForm();
    }
  }
}
