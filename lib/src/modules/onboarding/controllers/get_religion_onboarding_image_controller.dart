import 'package:aries/aries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

typedef ReligionBackgroundImagePath = String;

ReligionBackgroundImagePath getOnboardingBackgroundPath(Religion religion) {
  switch (religion) {
    case Religion.buddhism:
      return AriesImages.buddaImage;
    case Religion.catholicism:
      return AriesImages.christImage;
    case Religion.unknown:
    default:
      return AriesImages.sunAndMoonImage;
  }
}

final currentReligionProvider = StateProvider<Religion>(
  (ref) => Religion.unknown,
);

final selectedReligionProvider = StateProvider((ref) {
  final religion = ref.watch(currentReligionProvider);

  return getOnboardingBackgroundPath(religion);
});
