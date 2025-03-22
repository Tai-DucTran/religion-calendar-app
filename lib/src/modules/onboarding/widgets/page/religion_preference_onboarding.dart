import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/onboarding/widgets/widgets.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

class ReligionPreferenceOnboarding extends StatefulWidget {
  const ReligionPreferenceOnboarding({
    super.key,
    this.isProfilePageSetting = false,
  });

  final bool isProfilePageSetting;

  @override
  State<ReligionPreferenceOnboarding> createState() =>
      _ReligionPreferenceOnboardingState();
}

class _ReligionPreferenceOnboardingState
    extends State<ReligionPreferenceOnboarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _completeButtonAnimation;

  static const _animationDuration = Duration(
    milliseconds: 2000,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );

    // Initialize the fade animation with a delay
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    // Initialize complete button animation with longer delay and smoother transition
    _completeButtonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.95, // Start later at 85% of animation duration
          1.0,
          curve: Curves.easeInOut, // Smoother easing curve
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AriesColor.yellowP50,
                AriesColor.yellowP200,
              ],
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    context.l10n.myReligionIs,
                    style: AriesTextStyles.textHeading3.copyWith(
                      fontSize: 26,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacing.sp24,
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const ExpandableReligionButtonsSection(),
                  ),
                ],
              ),
              const OnboardingReligionBackground(),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: FadeTransition(
                  opacity: _completeButtonAnimation,
                  child: CompleteButton(widget.isProfilePageSetting),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
