import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
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
            height: 95,
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildNavItems(context),
            ),
          ),
          Positioned(
            top: -30,
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
            const SizedBox(height: 4), // Replace Spacing.sp4 with SizedBox
            Text(
              item.name,
              style: TextStyle(
                color:
                    isSelected ? AriesColor.yellowP300 : AriesColor.neutral100,
                fontSize: 12,
              ),
            ),
          ],
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
          height: 60,
          width: 60,
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
