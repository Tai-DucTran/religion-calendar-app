import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/user/models/religion_preference.dart';
import 'package:religion_calendar_app/src/modules/user/models/user_id.dart';

part 'user.freezed.dart';
part 'user.g.dart';

class TimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampConverter();

  @override
  DateTime? fromJson(dynamic timestamp) {
    if (timestamp == null) return null;
    if (timestamp is Timestamp) return timestamp.toDate();
    if (timestamp is String) return DateTime.parse(timestamp);
    return null;
  }

  @override
  dynamic toJson(DateTime? date) => date?.toIso8601String();
}

@freezed
class User with _$User {
  const factory User({
    required UserId userId,
    required String? displayName,
    required String? email,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    @Default(false) bool? hasCompleteOnboarding,
    @Default(false) bool? isVerified,
    @Default(null) String? profileImageUrl,
    ReligionPreference? religionPreference,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User._();
}
