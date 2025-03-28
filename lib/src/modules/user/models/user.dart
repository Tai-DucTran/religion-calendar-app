import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/user/models/religion_preference.dart';
import 'package:religion_calendar_app/src/modules/user/models/user_id.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required UserId userId,
    required String? displayName,
    required String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(false) bool? hasCompleteOnboarding,
    @Default(false) bool? isVerified,
    ReligionPreference? religionPreference,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User._();
}
