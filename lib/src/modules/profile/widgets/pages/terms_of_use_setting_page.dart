import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/other_implementation_constants.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class TermsOfUseSettingPage extends StatelessWidget {
  const TermsOfUseSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingPageTemplate(
      header: context.l10n.termsOfUseTitleText,
      child: Container(
        padding: EdgeInsets.only(
          left: 22.w,
          right: 22.w,
          bottom: 22.w,
        ),
        child: ReaderTemplate(
          documentPath: termsOfUseAssetPath,
        ),
      ),
    );
  }
}
