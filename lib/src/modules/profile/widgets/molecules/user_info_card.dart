import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/constants/screen_config.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';
import 'package:religion_calendar_app/src/modules/user/controllers/controllers.dart';
import 'package:religion_calendar_app/src/router/routes.dart';

class UserInfoCard extends ConsumerWidget {
  const UserInfoCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfor = ref.watch(userControllerProvider).value?.user;
    final userName = userInfor?.displayName;
    final userEmail = userInfor?.email;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenConfig.defaultHorizontalScreenPadding,
      ),
      constraints: BoxConstraints(
        maxHeight: 90.h,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileImage(
            imageSize: 32.r,
          ),
          Spacing.sp12,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName ?? userEmail ?? context.l10n.userDefaultNameText,
                  style: AriesTextStyles.textHeading5,
                ),
                Spacing.sp4,
                GestureDetector(
                  onTap: () {
                    context.push(
                      BasicInfoSettingRoute().location,
                    );
                  },
                  child: Text(
                    context.l10n.editUserInfoButtonText,
                    style: AriesTextStyles.textBodyNormal.copyWith(
                      color: AriesColor.yellowP600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
