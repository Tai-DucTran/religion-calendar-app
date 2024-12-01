import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/screen_config.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/authentication/controllers/controllers.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class AccountActionsSection extends ConsumerWidget {
  const AccountActionsSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenConfig.defaultHorizontalScreenPadding,
          ),
          child: CustomElevatedButton(
            text: LocalizedKeys.logoutButtonText,
            buttonColor: AriesColor.neutral10,
            width: double.infinity,
            height: 34.h,
            onPressed: () async {
              final authController =
                  ref.read(authStateControllerProvider.notifier);
              await authController.logOut();
            },
          ),
        ),
        Spacing.sp8,
        TextButton(
          onPressed: () {},
          child: Text(
            LocalizedKeys.deleteUserAccountButtonText,
            style: TextStyle(
              color: AriesColor.danger400,
            ),
          ),
        ),
      ],
    );
  }
}
