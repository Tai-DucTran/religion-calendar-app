import 'package:aries/aries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

typedef ReligionBackgroundImagePath = String;

ReligionBackgroundImagePath getOnboardingBackgroundPath(
    ReligionPreference religion) {
  switch (religion) {
    case ReligionPreference.buddhism:
      return AriesImages.buddaImage;
    case ReligionPreference.catholicism:
      return AriesImages.christImage;
    case ReligionPreference.unknown:
    default:
      return AriesImages.sunAndMoonImage;
  }
}

final currentReligionProvider = StateProvider<ReligionPreference>(
  (ref) => ReligionPreference.unknown,
);

final selectedReligionProvider = StateProvider((ref) {
  final religion = ref.watch(currentReligionProvider);

  return getOnboardingBackgroundPath(religion);
});
