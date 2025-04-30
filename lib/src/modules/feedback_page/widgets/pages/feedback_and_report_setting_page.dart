import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/feedback_form_setting_controller.dart';

import 'package:religion_calendar_app/src/modules/feedback_page/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/organisms/organisms.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';

class FeedbackAndReportSettingPage extends ConsumerWidget {
  const FeedbackAndReportSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingPageTemplate(
      header: context.l10n.feebackAndReportSettingTitlText,
      onPressed: () {
        final controller =
            ref.watch(feedbackFormSettingControllerProvider.notifier);

        controller.toggleExpanded(false);
        context.pop();
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 12.h,
            left: 24.w,
            right: 24.w,
          ),
          child: Column(
            spacing: 18.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FeedbackDetailForm(),
              FeedbackOrReportStatusesCard(),
            ],
          ),
        ),
      ),
    );
  }
}
