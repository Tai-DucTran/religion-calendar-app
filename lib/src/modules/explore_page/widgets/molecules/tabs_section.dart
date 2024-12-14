import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

class TabsSection extends StatelessWidget {
  const TabsSection({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      labelColor: AriesColor.yellowP950,
      unselectedLabelColor: AriesColor.neutral100,
      dividerColor: Colors.transparent,
      indicatorColor: AriesColor.yellowP950,
      tabs: [
        Tab(
          text: LocalizedKeys.libraryButtonText,
        ),
        Tab(
          text: LocalizedKeys.churchesButtonText,
        ),
      ],
    );
  }
}
