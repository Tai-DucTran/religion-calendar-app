import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/src/modules/navigation_bottom_bar/navigation_bottom_bar.dart';
import 'package:religion_calendar_app/src/router/routes.dart';

class NavigationBottomBar extends ConsumerStatefulWidget {
  const NavigationBottomBar({
    super.key,
    required this.navigationShell,
    required this.userId,
  });
  final StatefulNavigationShell navigationShell;
  final String? userId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavigationBottomBarState();
}

class _NavigationBottomBarState extends ConsumerState<NavigationBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 80.h,
          padding: EdgeInsets.only(
            bottom: 10.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildNavItems(context),
          ),
        ));
  }

  List<Widget> _buildNavItems(BuildContext context) {
    return NavigationBottomItemTypes.values.map(
      (type) {
        final item = type.item;
        final index = NavigationBottomItemTypes.values.indexOf(type);
        final isSelected = widget.navigationShell.currentIndex == index;

        return InkWell(
          onTap: () => _onTap(context, index),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              width: 90.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    item.iconPath,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? AriesColor.yellowP300
                          : AriesColor.neutral100,
                      BlendMode.srcIn,
                    ),
                  ),
                  Spacing.sp4,
                  Text(
                    textAlign: TextAlign.center,
                    item.name,
                    style: TextStyle(
                      color: isSelected
                          ? AriesColor.yellowP300
                          : AriesColor.neutral100,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).toList();
  }

  void _onTap(BuildContext context, int index) {
    final userId = widget.userId;

    String path;
    switch (index) {
      case 0:
        path = '${HomeRoute.path}?userId=$userId';
        break;
      case 1:
        path = '${CalendarRoute.path}?userId=$userId';
        break;
      case 2:
        path = '${ExploreRoute.path}?userId=$userId';
        break;
      case 3:
        path = '${ProfileRoute.path}?userId=$userId';
        break;
      default:
        path = '${HomeRoute.path}?userId=$userId';
    }
    context.go(path);
  }
}
