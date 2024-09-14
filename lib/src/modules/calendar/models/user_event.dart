import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/event_category.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/event_id.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/repeat_frequency.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

part 'user_event.freezed.dart';
part 'user_event.g.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent({
    required UserId userId,
    required EventId eventId,
    required String eventName,
    required EventCategory eventCategory,
    required bool isAllDay,
    required DateTime startingDate,
    required DateTime endingDate,
    required String location,
    required double remindMeBefore,
    required RepeatFrequency repeatFrequencyAt,
  }) = _UserEvent;

  factory UserEvent.fromJson(Map<String, dynamic> json) =>
      _$UserEventFromJson(json);

  const UserEvent._();
}
