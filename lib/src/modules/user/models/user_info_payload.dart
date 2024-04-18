import 'dart:collection';

import 'package:flutter/foundation.dart' show immutable;
import 'package:religion_calendar_app/src/constants/firebase_field_name.dart';
import 'package:religion_calendar_app/src/modules/user/models/religion.dart';
import 'package:religion_calendar_app/src/modules/user/models/user_id.dart';

@immutable
class UserInfoPayLoad extends MapView<String, dynamic> {
  UserInfoPayLoad({
    required UserId userId,
    required String? displayName,
    required String? email,
    DateTime? createdAt,
    Religion? religionReference,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email,
          FirebaseFieldName.createdAt: createdAt,
          FirebaseFieldName.religionReference: religionReference,
        });
}
