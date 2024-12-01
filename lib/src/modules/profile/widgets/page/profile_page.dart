import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainAppBackgroundContainer(
        paddingHorizontal: 0,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ProfilePageHeader(),
                  Spacing.sp24,
                  UserInfoCard(),
                  Spacing.sp24,
                  PreferencesSettingSection(),
                  Spacing.sp24,
                  GeneralSettingSection(),
                  Spacing.sp24,
                  ContactAndOtherSettingsSection(),
                  Spacing.sp24,
                  AccountActionsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
