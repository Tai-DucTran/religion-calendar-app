import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "feedback_statuses_provider.g.dart";

@riverpod
class FeedbackStatusesProvider extends _$FeedbackStatusesProvider {
  @override
  FutureOr<List<FeedbackForm>> build() async {
    final feedbacks =
        await ref.watch(feedbackFormRepositoryProvider).getUserFeedbackForms();
    return feedbacks;
  }
}
