import 'package:aries/aries.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

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
  NavigationBottomItem get item {
    switch (this) {
      case NavigationBottomItemTypes.home:
        return NavigationBottomItem(
          iconSelectedPath: AriesIcons.homeLineFillIcon,
          iconUnSelectedPath: AriesIcons.homeOutlineIcon,
          name: LocalizedKeys.homeNavItemText,
        );
      case NavigationBottomItemTypes.profile:
        return NavigationBottomItem(
          iconSelectedPath: AriesIcons.user03LineFillIcon,
          iconUnSelectedPath: AriesIcons.user03OutlineIcon,
          name: LocalizedKeys.profileNavItemText,
        );
    }
  }
}
