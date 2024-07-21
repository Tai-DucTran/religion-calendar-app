import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/user/models/religion_prefernce.dart';
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
    ReligionPreference? religionReference,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User._();
}
