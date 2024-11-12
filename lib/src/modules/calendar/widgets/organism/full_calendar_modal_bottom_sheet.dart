import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/constant_values.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/molecules/molecules.dart';

class FullCalendarModalBottomSheet extends ConsumerStatefulWidget {
  const FullCalendarModalBottomSheet({super.key});

  static Future<bool> show(
    BuildContext context,
  ) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AriesColor.neutral0,
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
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final screenHeight = MediaQuery.of(context).size.height;

    final markedDates = {
      DateTime(2024, 11, 5): Colors.red,
      DateTime(2024, 11, 10): Colors.blue,
      DateTime(2024, 11, 15): Colors.green,
    };

    return FractionallySizedBox(
      heightFactor: bottomSheetHeightFactorMax,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: bottomPadding,
        ),
        child: Builder(builder: (context) {
          return Container(
            height: screenHeight * bottomSheetHeightFactorMax,
            decoration: BoxDecoration(
              color: const Color(0xFFfcf7e9).withOpacity(
                0.8,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  20,
                ),
                topRight: Radius.circular(
                  20,
                ),
              ),
            ),
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 12.h,
              left: 12.w,
              right: 12.w,
            ),
            child: FullCalendarSection(
              markedDates: markedDates,
            ),
          );
        }),
      ),
    );
  }
}
