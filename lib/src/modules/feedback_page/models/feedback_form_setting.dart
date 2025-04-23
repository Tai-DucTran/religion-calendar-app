import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';

part "feedback_form_setting.freezed.dart";
part "feedback_form_setting.g.dart";

@freezed
class FeedbackFormSetting with _$FeedbackFormSetting {
  const factory FeedbackFormSetting({
    @Default(false) bool isExpanded,
    required FeedbackForm feedbackForm,
  }) = _FeedbackFormSetting;

  factory FeedbackFormSetting.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFormSettingFromJson(json);

  const FeedbackFormSetting._();
}
