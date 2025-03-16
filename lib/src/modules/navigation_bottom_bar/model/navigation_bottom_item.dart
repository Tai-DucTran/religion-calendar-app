import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

class NavigationBottomItem {
  final String iconSelectedPath;
  final String iconUnSelectedPath;
  final String name;

  NavigationBottomItem({
    required this.iconSelectedPath,
    required this.iconUnSelectedPath,
    required this.name,
  });
}

enum NavigationBottomItemTypes {
  home,
  profile,
}

extension NavigationBottomItemExtension on NavigationBottomItemTypes {
  NavigationBottomItem getItem(BuildContext context) {
    switch (this) {
      case NavigationBottomItemTypes.home:
        return NavigationBottomItem(
          iconSelectedPath: AriesIcons.homeLineFillIcon,
          iconUnSelectedPath: AriesIcons.homeOutlineIcon,
          name: context.l10n.homeNavItemText,
        );
      case NavigationBottomItemTypes.profile:
        return NavigationBottomItem(
          iconSelectedPath: AriesIcons.user03LineFillIcon,
          iconUnSelectedPath: AriesIcons.user03OutlineIcon,
          name: context.l10n.profileNavItemText,
        );
    }
  }
}
