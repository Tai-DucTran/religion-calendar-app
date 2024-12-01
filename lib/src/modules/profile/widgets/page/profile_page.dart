import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepo = ref.watch(authenticatorRepositoryProvider);
    final currentUser = authRepo.currentUser;
    final isVerifiedEmail = currentUser?.emailVerified;

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
                  Text('Is verified email? $isVerifiedEmail'),
                  TextButton(
                    onPressed: () async {
                      final authController =
                          ref.read(authStateControllerProvider.notifier);
                      await authController.logOut();
                    },
                    child: const Text(
                      'Logout',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
