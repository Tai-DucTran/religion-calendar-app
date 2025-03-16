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
  });
  final StatefulNavigationShell navigationShell;

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
      ),
    );
  }

  List<Widget> _buildNavItems(BuildContext context) {
    return NavigationBottomItemTypes.values.map(
      (type) {
        final item = type.item;
        final index = NavigationBottomItemTypes.values.indexOf(type);
        final isSelected = widget.navigationShell.currentIndex == index;
        final selectedColor =
            isSelected ? AriesColor.yellowP950 : AriesColor.neutral100;
        final selectedIconPath =
            isSelected ? item.iconSelectedPath : item.iconUnSelectedPath;

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
                    selectedIconPath,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      selectedColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  Spacing.sp4,
                  Text(
                    textAlign: TextAlign.center,
                    item.name,
                    style: TextStyle(
                      color: selectedColor,
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
    String path;
    switch (index) {
      case 0:
        path = HomeRoute.path;
        break;
      case 1:
        path = ProfileRoute.path;
        break;
      default:
        path = HomeRoute.path;
    }
    context.go(path);
  }
}
