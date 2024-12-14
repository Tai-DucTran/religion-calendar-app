import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/screen_config.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/onboarding/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/repositories/repositories.dart';
import 'package:religion_calendar_app/src/utils/string_helper.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ReligionPreferencesSettingPage extends ConsumerWidget {
  const ReligionPreferencesSettingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(selectedReligionProvider);
    final currentReligionPref =
        ref.watch(currentReligionProvider.notifier).state.name.toUpperCase();
    final userId = ref.watch(authenticatorRepositoryProvider).currentUser?.uid;

    final screenHeight = MediaQuery.of(context).size.height;

    return SettingPageTemplate(
      header: LocalizedKeys.religionPreferencesSettingTitleText,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacing.sp20,
          SizedBox(
            height: screenHeight * 0.4,
            child: Container(
              color: AriesColor.yellowP50,
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
            ),
            itemCount: ReligionPreference.values.length,
            itemBuilder: (context, index) {
              final religion = ReligionPreference.values[index];
              final isSelected = religion == ref.watch(currentReligionProvider);
              final color =
                  isSelected ? AriesColor.yellowP600 : AriesColor.neutral300;
              return ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: ScreenConfig.defaultHorizontalScreenPadding,
                ),
                title: Text(
                  religion.localizedName.toCapitalized(),
                  style: AriesTextStyles.textBodyNormal,
                ),
                horizontalTitleGap: 4,
                dense: true,
                trailing: isSelected
                    ? Icon(
                        Icons.check,
                        color: color,
                      )
                    : null,
                onTap: () {
                  ref.read(currentReligionProvider.notifier).state = religion;
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenConfig.defaultHorizontalScreenPadding,
            ),
            child: CtaFullWidthButton(
              buttonText: LocalizedKeys.updateButtonText,
              onPressed: () async {
                final userFirestoreController =
                    ref.read(userFirestoreRepositoryProvider);
                userFirestoreController.updateReligionPreferenceOnboarding(
                  userId: userId,
                  religionPreference: currentReligionPref,
                );
                Navigator.of(context).pop(true);
              },
            ),
          ),
          Spacing.sp24,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenConfig.defaultHorizontalScreenPadding,
            ),
            child: BottomRichTextWithAction(
              initialQuestion: '${LocalizedKeys.youWantToHaveYourReligion} ',
              textSpan: LocalizedKeys.submitHereButtonText,
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
