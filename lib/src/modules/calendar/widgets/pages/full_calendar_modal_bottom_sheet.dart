import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/other_implementation_constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class FullCalendarModalBottomSheet extends ConsumerStatefulWidget {
  const FullCalendarModalBottomSheet({super.key});

  static Future<bool> show(
    BuildContext context,
  ) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AriesColor.yellowP25,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20.0,
          ),
        ),
      ),
      builder: (context) => const FullCalendarModalBottomSheet(),
    );
    return result ?? false;
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FullCalendarModalBottomSheetState();
}

class _FullCalendarModalBottomSheetState
    extends ConsumerState<FullCalendarModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * bottomSheetHeightFactorMax,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.w,
              child: BannerLine(),
            ),
            Expanded(
              child: const FullCalendarSection(),
            ),
          ],
        ),
      ),
    );
  }
}
