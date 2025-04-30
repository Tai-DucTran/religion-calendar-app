import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

class MessageBuddle extends StatelessWidget {
  const MessageBuddle({
    super.key,
    required this.message,
    required this.isFromTeam,
  });

  final FeedbackMessage message;
  final bool isFromTeam;

  @override
  Widget build(BuildContext context) {
    final timestamp =
        "${message.createdAt.day}/${message.createdAt.month}/${message.createdAt.year} ${message.createdAt.hour}:${message.createdAt.minute.toString().padLeft(2, '0')}";

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 16.h,
        left: isFromTeam ? 24.w : 0,
        right: isFromTeam ? 0 : 24.w,
      ),
      child: Column(
        crossAxisAlignment:
            isFromTeam ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: isFromTeam ? AriesColor.success50 : AriesColor.neutral20,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
                bottomLeft:
                    isFromTeam ? Radius.circular(16.r) : Radius.circular(4.r),
                bottomRight:
                    isFromTeam ? Radius.circular(4.r) : Radius.circular(16.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isFromTeam && message.authorName != null) ...[
                  Text(
                    message.authorName!,
                    style: AriesTextStyles.textBodySmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AriesColor.success700,
                    ),
                  ),
                  SizedBox(height: 4.h),
                ],

                // Message content
                ReadMoreText(
                  message.messageText ?? "",
                  trimCollapsedText: context.l10n.readMoreButtonText,
                  trimExpandedText: context.l10n.showLessButtonText,
                  trimLines: 5,
                  style: AriesTextStyles.textBodyNormal.copyWith(
                    color: isFromTeam
                        ? AriesColor.success600
                        : AriesColor.neutral900,
                  ),
                  moreStyle: AriesTextStyles.textBodySmall.copyWith(
                    color: AriesColor.yellowP900,
                  ),
                  lessStyle: AriesTextStyles.textBodySmall.copyWith(
                    color: AriesColor.yellowP900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 4.h,
              left: 8.w,
              right: 8.w,
            ),
            child: Text(
              timestamp,
              style: AriesTextStyles.textBodySmall.copyWith(
                color: AriesColor.neutral300,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
