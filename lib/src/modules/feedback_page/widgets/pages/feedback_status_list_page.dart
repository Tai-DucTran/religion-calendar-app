import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/providers/providers.dart';

import 'package:religion_calendar_app/src/modules/feedback_page/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class FeedbackStatusListPage extends ConsumerWidget {
  const FeedbackStatusListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackListAsync =
        ref.watch(userFeedbackConversationsProviderProvider());

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
                      return FeedbackOrReportDetailsCard(
                        feedback: feedback,
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          },
          loading: () => const Center(
            child: LoadingOverlayContainer(),
          ),
          error: (error, stack) => Center(
            child: Text(
              'Error loading feedback: $error',
            ),
          ),
        ),
      ),
    );
  }
}
