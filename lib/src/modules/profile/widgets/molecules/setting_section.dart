import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/constants/screen_config.dart';
import 'package:religion_calendar_app/src/modules/profile/models/models.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
    required this.heading,
    required this.settingOptions,
  });

  final String heading;
  final List<SettingOptions> settingOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenConfig.defaultHorizontalScreenPadding,
          ),
          child: Text(
            heading,
            style: AriesTextStyles.textHeading6,
          ),
        ),
        Spacing.sp14,
        ...settingOptions.map(
          (option) {
            final settingOption = option.item;
            return SettingCard(
              iconPath: settingOption.iconPath,
              route: settingOption.route,
              title: settingOption.title,
            );
          },
        ),
      ],
    );
  }
}
