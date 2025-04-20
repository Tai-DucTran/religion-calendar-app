import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:religion_calendar_app/src/modules/feedback_page/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/organisms/organisms.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';

class FeedbackAndReportSettingPage extends StatelessWidget {
  const FeedbackAndReportSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingPageTemplate(
      header: context.l10n.feebackAndReportSettingTitlText,
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
