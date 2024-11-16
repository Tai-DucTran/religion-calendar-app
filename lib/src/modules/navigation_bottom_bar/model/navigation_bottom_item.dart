import 'package:aries/aries.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

class NavigationBottomItem {
  final String iconPath;
  final String name;

  NavigationBottomItem({
    required this.iconPath,
    required this.name,
  });
}

enum NavigationBottomItemTypes {
  home,
  calendar,
  explore,
  profile,
}

extension NavigationBottomItemExtension on NavigationBottomItemTypes {
  NavigationBottomItem get item {
    switch (this) {
      case NavigationBottomItemTypes.home:
        return NavigationBottomItem(
          iconPath: AriesIcons.homeOutlineIcon,
          name: LocalizedKeys.homeNavItemText,
        );
      case NavigationBottomItemTypes.calendar:
        return NavigationBottomItem(
          iconPath: AriesIcons.calendarOutlineIcon,
          name: 'Daily',
        );
      case NavigationBottomItemTypes.explore:
        return NavigationBottomItem(
          iconPath: AriesIcons.sunOutlineIcon,
          name: LocalizedKeys.exploreNavItemText,
        );
      case NavigationBottomItemTypes.profile:
        return NavigationBottomItem(
          iconPath: AriesIcons.userOutlineIcon,
          name: LocalizedKeys.profileNavItemText,
        );
    }
  }
}
