import 'package:flutter/material.dart';
import 'package:full_calender/enums/time_zone.dart';
import 'package:full_calender/full_calender.dart';
import 'package:full_calender/full_calender_extension.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/controllers/controllers.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lunarDate =
        FullCalender.now(TimeZone.indonesiaUTC8.timezone).lunarDate;
    final solarDate =
        FullCalenderExtension.convertLunarDateToSolarDate(lunarDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Home',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              final authController =
                  ref.read(authStateControllerProvider.notifier);
              await authController.logOut();
            },
            child: const Text(
              'Logout',
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is solar cal $solarDate'),
            Text('This is lunar cal $lunarDate'),
          ],
        ),
      ),
    );
  }
}
