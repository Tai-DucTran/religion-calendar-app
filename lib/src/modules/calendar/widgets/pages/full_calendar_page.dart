import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/widgets/linear_gradient_containers/linear_gradient_containers.dart';

class FullCalendarPage extends ConsumerWidget {
  const FullCalendarPage({
    super.key,
    this.onDateSelected,
  });

  final Function(DateTime)? onDateSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AriesColor.yellowP50,
      appBar: AppBar(
        backgroundColor: AriesColor.yellowP50,
        surfaceTintColor: AriesColor.yellowP50,
        title: SelectedMonthAppBarTitle(),
        leading: IconButton(
          onPressed: () {
            context.pop();
            ref.read(displayedMonthProvider.notifier).state = DateTime.now();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AriesColor.neutral700,
          ),
        ),
        actions: [
          ChangeMonthButtonActions(),
        ],
      ),
      body: MainAppBackgroundContainer(
          child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FullCalendarWeekdayHeader(),
                    Spacing.sp4,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.42,
                      child: FullCalendarDaysInMonth(),
                    ),
                    const FullCalendarUltilsAndEventsSection(),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
