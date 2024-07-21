import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/user/models/religion_prefernce.dart';
import 'package:religion_calendar_app/src/modules/user/models/user_id.dart';

part 'user_info_payload.freezed.dart';
part 'user_info_payload.g.dart';

@freezed
class UserInfoPayLoad with _$UserInfoPayLoad {
  const factory UserInfoPayLoad({
    required UserId userId,
    required String? displayName,
    required String? email,
    DateTime? createdAt,
    ReligionPreference? religionReference,
  }) = _UserInfoPayLoad;

  const UserInfoPayLoad._();

  factory UserInfoPayLoad.fromJson(Map<String, dynamic> json) =>
      _$UserInfoPayLoadFromJson(json);
}
