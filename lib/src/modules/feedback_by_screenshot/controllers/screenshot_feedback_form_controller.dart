import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screenshot_feedback_form_controller.g.dart';

@Riverpod(keepAlive: true)
class ScreenshotFeedbackFormController
    extends _$ScreenshotFeedbackFormController {
  @override
  bool build() {
    return false;
  }

  void showFeedbackForm() {
    state = true;
  }

  void hideFeedbackForm() {
    state = false;
  }
}
