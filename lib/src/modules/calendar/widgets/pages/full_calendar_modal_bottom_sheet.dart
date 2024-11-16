import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/constants/constant_values.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/organism/organism.dart';

class FullCalendarModalBottomSheet extends ConsumerStatefulWidget {
  const FullCalendarModalBottomSheet({super.key});

  static Future<bool> show(
    BuildContext context,
  ) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AriesColor.yellowP50,
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
            child: const FullCalendarSection(),
          );
        }),
      ),
    );
  }
}
