import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/other_implementation_constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';

class AllEventsModalBottomSheet extends ConsumerStatefulWidget {
  const AllEventsModalBottomSheet({super.key});

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
      builder: (context) => const AllEventsModalBottomSheet(),
    );
    return result ?? false;
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllEventsModalBottomSheetState();
}

class _AllEventsModalBottomSheetState
    extends ConsumerState<AllEventsModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: bottomSheetHeightFactorMax,
      child: Column(
        children: [
          SizedBox(
            height: 20.w,
            child: BannerLine(),
          ),
          Expanded(
            child: const AllEventsSection(),
          ),
        ],
      ),
    );
  }
}
