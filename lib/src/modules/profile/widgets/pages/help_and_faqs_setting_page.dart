import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/profile/models/models.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';
import 'package:toggle_list/toggle_list.dart';

class HelpAndFAQsSettingPage extends StatelessWidget {
  const HelpAndFAQsSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingPageTemplate(
      header: context.l10n.helpAndFAQsSettingTitleText,
      child: Container(
        padding: EdgeInsets.only(
          top: 48,
        ),
        child: ToggleList(
          divider: Spacing.sp18,
          children: FAQsTitle.values.map(
            (faq) {
              return ToggleListItem(
                isInitiallyExpanded: faq.index == 0,
                title: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: MarkdownReader(
                    content: faq.getTitleLocalized(context),
                  ),
                ),
                expandedHeaderDecoration: BoxDecoration(
                  color: AriesColor.yellowP100,
                  borderRadius: BorderRadius.circular(3.r),
                ),
                expandedTitle: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: MarkdownReader(
                    content: faq.getTitleLocalized(context),
                  ),
                ),
                content: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: MarkdownReader(
                    content: faq.getAnswerLocalized(context),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
