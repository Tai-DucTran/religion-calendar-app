import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/repositories/repositories.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/molecules/molecules.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class FeedbackStatusDetailsBottomSheet extends ConsumerStatefulWidget {
  const FeedbackStatusDetailsBottomSheet({
    super.key,
    required this.conversationId,
    this.initialFeedback,
    required this.feedbackTitle,
  });

  final String conversationId;
  final FeedbackConversation? initialFeedback;
  final String feedbackTitle;
  static Future<void> show({
    required BuildContext context,
    required String conversationId,
    FeedbackConversation? initialFeedback,
    required String feedbackTitle,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      enableDrag: true,
      useSafeArea: true,
      isDismissible: true,
      backgroundColor: AriesColor.yellowP25,
      barrierColor: Colors.black54,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (context) => FeedbackStatusDetailsBottomSheet(
        conversationId: conversationId,
        initialFeedback: initialFeedback,
        feedbackTitle: feedbackTitle,
      ),
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeedbackStatusDetailsBottomSheetState();
}

class _FeedbackStatusDetailsBottomSheetState
    extends ConsumerState<FeedbackStatusDetailsBottomSheet> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final conversationAsync = ref.watch(
      feedbackConversationStreamProvider(
        widget.conversationId,
      ),
    );

    return conversationAsync.when(
      data: (feedback) {
        if (feedback == null) {
          return SomethingWentWrong();
        }

        return _buildBottomSheetContent(feedback);
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => SomethingWentWrong(),
    );
  }

  Widget _buildBottomSheetContent(FeedbackConversation feedback) {
    final hasAdditionalMessages = feedback.messages.length > 1;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    Log.dev("feedback details: $feedback");

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 20.r,
        left: 20.r,
        right: 20.r,
        bottom: bottomInset > 0 ? 8.r : 20.r,
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          bottom: bottomInset + 20.r,
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          minHeight: 300.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GeneralFeedbackStatusOnBottomSheet(
                      feedback: feedback,
                      feedbackTitle: widget.feedbackTitle,
                    ),
                    if (hasAdditionalMessages) ...[
                      Spacing.sp24,
                      ConversationSection(
                        messages: feedback.messages,
                      ),
                    ],
                    Spacing.sp24,
                  ],
                ),
              ),
            ),
            InputNewMessageField(
              feedback: feedback,
            ),
          ],
        ),
      ),
    );
  }
}
