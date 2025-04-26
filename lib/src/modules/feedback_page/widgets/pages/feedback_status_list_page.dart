import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/utils/helpers.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/feedback_form.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/providers/feedback_statuses_provider.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/organisms/organisms.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class FeedbackStatusListPage extends ConsumerWidget {
  const FeedbackStatusListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackListAsync = ref.watch(feedbackStatusesProviderProvider);

    return SettingPageTemplate(
      header: context.l10n.feedbackListTitlePageText,
      child: Container(
        child: feedbackListAsync.whenOrNull(
          data: (feedbackList) {
            if (feedbackList.isEmpty) {
              return EmptyPage(
                subTitle: context.l10n.emptyFeedbackText,
              );
            }

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: feedbackList.map(
                    (feedback) {
                      final feedbackDate = getFullSolarDateText(
                        locale: Localizations.localeOf(context).toString(),
                        inputDate: feedback.createdAt,
                        dateFormat: DateTimeFormat.dateMonthYear,
                      );
                      final feedbackTitle =
                          '${feedback.feedbackType!.getLocalized(context)} - $feedbackDate';

                      return Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        color: AriesColor.neutral0,
                        child: ListTile(
                          title: Text(
                            feedbackTitle,
                            style: AriesTextStyles.textHeading7,
                          ),
                          subtitle: Column(
                            spacing: 4.h,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                feedback.feedbackText ?? '',
                                style: AriesTextStyles.textBodySmall,
                              ),
                            ],
                          ),
                          trailing: feedback.status!.getIcon(),
                          onTap: () async {
                            FeedbackStatusDetailsBottomSheet.show(
                              context: context,
                              feedbackForm: feedback,
                              feedbackTitle: feedbackTitle,
                            );
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Text('Error loading feedback: $error'),
          ),
        ),
      ),
    );
  }
}
