import 'package:feedback/feedback.dart';
import 'package:religion_calendar_app/src/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:religion_calendar_app/src/modules/feedback/controllers/feedback_controller.dart';

part 'feedback_service_controller.g.dart';

@Riverpod(keepAlive: true)
class FeedbackService extends _$FeedbackService {
  @override
  void build() {}

  void showFeedbackForm() {
    final context = rootKey.currentContext;
    if (context != null) {
      ref.read(feedbackControllerProvider.notifier).showFeedbackForm();
      BetterFeedback.of(context).show((feedback) {
        ref.read(feedbackControllerProvider.notifier).hideFeedbackForm();

        // TODO (@Tai-DucTran) Process the feedback (save to Firebase, etc.)
        _processFeedback(feedback);
      });
    } else {
      Log.error('Cannot show feedback form: context is null');
    }
  }

  void _processFeedback(UserFeedback feedback) {
    // TODO (@Tai-DucTran) Process the feedback here (save to Firebase, etc.)
    //https://taisidehustle.atlassian.net/browse/KAN-171
    Log.info('Feedback received: $feedback');
  }
}
