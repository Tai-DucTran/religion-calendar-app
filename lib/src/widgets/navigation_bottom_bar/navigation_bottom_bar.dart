import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/src/widgets/navigation_bottom_bar/model/model.dart';

class NavigationBottomBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationBottomBar({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
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
          Positioned(
            top: -30.h,
            child: _buildFloatingActionButton(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems(BuildContext context) {
    return NavigationBottomItemTypes.values.map((type) {
      final item = type.item;
      final index = NavigationBottomItemTypes.values.indexOf(type);
      final isSelected = navigationShell.currentIndex == index;

      return InkWell(
        onTap: () => _onTap(context, index),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox(
            width: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  item.iconPath,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    isSelected ? AriesColor.yellowP300 : AriesColor.neutral100,
                    BlendMode.srcIn,
                  ),
                ),
                Spacing.sp4,
                Text(
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
    }).toList();
  }

  Widget _buildFloatingActionButton() {
    return Material(
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          // TODO (Tai): Handle adding new calendar
        },
        child: Container(
          height: 56.h,
          width: 60.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AriesColor.yellowP300,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
