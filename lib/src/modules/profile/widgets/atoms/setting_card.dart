import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/constants/constants.dart';

class SettingCard extends StatefulWidget {
  const SettingCard({
    super.key,
    required this.iconPath,
    required this.route,
    required this.title,
  });

  final String iconPath;
  final String route;
  final String title;

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  late bool _isTapped;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isTapped = false;
    });
  }

  void _handleTap() {
    setState(() {
      _isTapped = true;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _isTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _handleTap();
        context.push(widget.route);
      },
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: ScreenConfig.defaultHorizontalScreenPadding,
        ),
        decoration: BoxDecoration(
          color: _isTapped ? AriesColor.yellowP75 : AriesColor.yellowP50,
          border: Border(
            bottom: BorderSide(
              color: AriesColor.neutral30,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                SvgPicture.asset(
                  widget.iconPath,
                  colorFilter: ColorFilter.mode(
                    AriesColor.neutral70,
                    BlendMode.srcIn,
                  ),
                ),
                Spacing.sp6,
                Text(
                  widget.title,
                  style: AriesTextStyles.textBodyNormal,
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AriesColor.neutral70,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
