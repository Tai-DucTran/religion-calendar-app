import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_controller.g.dart';

@Riverpod(keepAlive: true)
class FeedbackController extends _$FeedbackController {
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
