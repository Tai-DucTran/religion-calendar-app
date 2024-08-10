import 'package:aries/aries.dart';

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
          name: 'Home',
        );
      case NavigationBottomItemTypes.calendar:
        return NavigationBottomItem(
          iconPath: AriesIcons.calendarOutlineIcon,
          name: 'Calendar',
        );
      case NavigationBottomItemTypes.explore:
        return NavigationBottomItem(
          iconPath: AriesIcons.sunOutlineIcon,
          name: 'Explore',
        );
      case NavigationBottomItemTypes.profile:
        return NavigationBottomItem(
          iconPath: AriesIcons.userOutlineIcon,
          name: 'Profile',
        );
    }
  }
}
