import 'package:aries/aries.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

String getEventImageCard(
  ReligionPreference? userReligion,
  EventCategory eventCategory,
) {
  final isReligionEvent = eventCategory == EventCategory.religionEvent;

  if (isReligionEvent) {
    if (userReligion != null) {
      return userReligion.image;
    }
    return AriesImages.sunAndMoonImage;
  }

  return eventCategory.image!;
}
