import 'package:aries/aries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/user/controllers/user_controller.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

typedef ReligionBackgroundImagePath = String;

ReligionBackgroundImagePath getOnboardingBackgroundPath(
    ReligionPreference religion) {
  switch (religion) {
    case ReligionPreference.buddhism:
      return AriesImages.buddaOnboardingBackground;
    case ReligionPreference.catholicism:
      return AriesImages.catholicOnboardingBackground;
    case ReligionPreference.unknown:
      return AriesImages.spiritualOnboardingBackground;
  }
}

final currentReligionProvider = StateProvider<ReligionPreference>(
  (ref) {
    final userProvider = ref.watch(userControllerProvider);
    final currentUserReligion = userProvider.value?.user?.religionPreference;

    if (currentUserReligion != null) return currentUserReligion;
    return ReligionPreference.catholicism;
  },
);

final selectedReligionBackgroundProvider = StateProvider((ref) {
  final religion = ref.watch(currentReligionProvider);

  return getOnboardingBackgroundPath(religion);
});
