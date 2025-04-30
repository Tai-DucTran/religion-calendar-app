import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/repositories/feedback_conversation_repo.dart';

class InputNewMessageField extends ConsumerStatefulWidget {
  const InputNewMessageField({
    super.key,
    required this.feedback,
  });

  final FeedbackConversation feedback;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InputNewMessageFieldState();
}

class _InputNewMessageFieldState extends ConsumerState<InputNewMessageField> {
  final TextEditingController _messageController = TextEditingController();
  bool _isSubmitting = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _messageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        SizedBox(height: 12.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AriesColor.neutral0,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AriesColor.neutral30,
                  ),
                ),
                child: TextField(
                  controller: _messageController,
                  focusNode: _focusNode,
                  maxLines: 3,
                  minLines: 1,
                  textCapitalization: TextCapitalization.sentences,
                  onSubmitted: (value) {
                    if (value.isNotEmpty && !_isSubmitting) {
                      _submitMessage(
                        widget.feedback,
                      );
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Type your response...",
                    hintStyle: TextStyle(
                      color: AriesColor.neutral200,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            InkWell(
              onTap: _isSubmitting
                  ? null
                  : () => _submitMessage(
                        widget.feedback,
                      ),
              borderRadius: BorderRadius.circular(8.r),
              child: Icon(
                Icons.send,
                color: AriesColor.yellowP900,
                size: 24.r,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _submitMessage(FeedbackConversation feedback) async {
    final message = _messageController.text.trim();

    // Don't proceed if message is empty
    if (message.isEmpty) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      final repository = ref.read(feedbackConversationRepositoryProvider);

      await repository.addMessageToConversation(
        feedback.id,
        message,
      );
      _messageController.clear();
    } catch (e) {
      // Show error message if submission fails
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error sending response: $e"),
            backgroundColor: AriesColor.danger500,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });

        _focusNode.requestFocus();
      }
    }
  }
}
