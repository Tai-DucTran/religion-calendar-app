import 'package:aries/aries.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/widgets.dart';

class ScreenshotFeedbackForm extends ConsumerStatefulWidget {
  const ScreenshotFeedbackForm({
    super.key,
    required this.onSubmit,
    required this.scrollController,
  });

  final OnSubmit onSubmit;
  final ScrollController? scrollController;

  @override
  ConsumerState<ScreenshotFeedbackForm> createState() =>
      _ScreenshotFeedbackFormState();
}

class _ScreenshotFeedbackFormState extends ConsumerState<ScreenshotFeedbackForm>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final _feedbackController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(
        milliseconds: 1500,
      ),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 10).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(children: [
            if (widget.scrollController != null)
              const FeedbackSheetDragHandle(),
            Container(
              color: AriesColor.yellowP50,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: ListView(
                controller: widget.scrollController,
                children: [
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Column(
                          children: [
                            Transform.translate(
                              offset: Offset(0, -_animation.value),
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: AriesColor.yellowP950,
                                size: 24.r,
                              ),
                            ),
                            Text(
                              "Swipe up for more details feedback form",
                              style: AriesTextStyles.textBodySmall.copyWith(
                                color: AriesColor.yellowP950,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }),
                  Spacing.sp12,
                  FeelingReatesWrapper(),
                  Spacing.sp12,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpandedFeedbackForm(
                      isScreenShootFeedback: true,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
