import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:religion_calendar_app/src/modules/onboarding/controllers/controllers.dart';

class OnboardingReligionBackground extends ConsumerStatefulWidget {
  const OnboardingReligionBackground({super.key});

  @override
  ConsumerState<OnboardingReligionBackground> createState() =>
      _OnboardingReligionBackgroundState();
}

class _OnboardingReligionBackgroundState
    extends ConsumerState<OnboardingReligionBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  String _currentBackground = '';
  String _nextBackground = '';
  bool _isAnimating = false;
  bool _isInitialAnimation = true;
  bool _shouldShow = false;

  // Constants for animation configuration
  static const _animationDuration = Duration(milliseconds: 400);
  static const _initialDelay = Duration(milliseconds: 1000);
  static const _entranceDelay = 0.4;

  // Constants for slide transitions
  static const _buddhaMoveOffset = Offset(-0.03, -0.03);
  static const _buddhaExitOffset = Offset(0.3, 0.3);
  static const _catholicMoveOffset = Offset(0.05, 0.0);
  static const _catholicExitOffset = Offset(-0.1, 0.0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _animationDuration,
      vsync: this,
    )..addStatusListener(_handleAnimationStatus);

    // Delay the initial Catholic entrance animation
    Future.delayed(_initialDelay, () {
      if (mounted) {
        setState(() {
          _isAnimating = true;
          _shouldShow = true;
          // _currentBackground =
          //     AriesImages.catholicOnboardingBackground; // Adjust path as needed
        });
        _controller.forward();
      }
    });
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_isInitialAnimation) {
        setState(() {
          _isInitialAnimation = false;
          _isAnimating = false;
          _shouldShow = true;
        });
      } else {
        setState(() {
          _currentBackground = _nextBackground;
          _isAnimating = false;
          _shouldShow = true;
        });
      }
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateBackground(String newBackground) {
    if (newBackground == _currentBackground) return;

    if (_isAnimating) {
      _nextBackground = newBackground;
    } else {
      setState(() {
        _nextBackground = newBackground;
        _isAnimating = true;
      });
      Future.delayed(_animationDuration, () {
        if (mounted) _controller.forward();
      });
    }
  }

  TweenSequence<Offset> _buildCatholicExitSequence() {
    return TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: _catholicMoveOffset,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: _catholicMoveOffset,
          end: _catholicExitOffset,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 70,
      ),
    ]);
  }

  TweenSequence<Offset> _buildBuddhaExitSequence() {
    return TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: _buddhaMoveOffset,
        ).chain(
          CurveTween(
            curve: Curves.easeOut,
          ),
        ),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: _buddhaMoveOffset,
          end: _buddhaExitOffset,
        ).chain(
          CurveTween(
            curve: Curves.easeIn,
          ),
        ),
        weight: 70,
      ),
    ]);
  }

  Offset _getEntranceOffset(bool isBuddhism, bool isCatholicism) {
    if (isBuddhism) {
      return const Offset(
        0.1,
        0.1,
      );
    }
    if (isCatholicism) {
      return const Offset(
        -0.1,
        0.0,
      );
    }
    return Offset.zero;
  }

  @override
  Widget build(BuildContext context) {
    final selectedBackground = ref.watch(selectedReligionBackgroundProvider);

    // Initialize background changes after initial animation
    if (_currentBackground.isEmpty) {
      _currentBackground = selectedBackground;
    } else if (selectedBackground != _currentBackground &&
        selectedBackground != _nextBackground) {
      _updateBackground(selectedBackground);
    }

    if (_currentBackground.isEmpty) {
      return const SizedBox.shrink();
    }

    final isBuddhism = _nextBackground.contains('budda_onboarding');
    final isCatholicism = _nextBackground.contains('catholic_onboarding');
    final isCurrentCatholicism =
        _currentBackground.contains('catholic_onboarding');
    final isCurrentBuddhism = _currentBackground.contains('budda_onboarding');

    final entranceInterval =
        Interval(_entranceDelay, 1.0, curve: Curves.easeIn);

    return Positioned(
      top: 300,
      left: 0,
      right: 0,
      bottom: 0,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Exit animation for current background (only for religion changes, not initial animation)
            if (_isAnimating && !_isInitialAnimation)
              _buildExitAnimation(
                isCurrentCatholicism: isCurrentCatholicism,
                isCurrentBuddhism: isCurrentBuddhism,
              ),

            // Initial animation or entrance animation for religion changes
            if (_isAnimating)
              _buildInitialOrEntranceAnimation(
                isInitial: _isInitialAnimation,
                isBuddhism: isBuddhism,
                isCatholicism: isCatholicism,
                entranceInterval: entranceInterval,
              ),

            // Static display when not animating but should be shown
            if (!_isAnimating && _shouldShow)
              SvgPicture.asset(
                _currentBackground,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialOrEntranceAnimation({
    required bool isInitial,
    required bool isBuddhism,
    required bool isCatholicism,
    required Interval entranceInterval,
  }) {
    // For initial animation, slide in from left with fade
    if (isInitial) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeIn,
          ),
        ),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-0.2, 0.0), // Start from left side
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOutCubic, // Smooth easing for natural motion
            ),
          ),
          child: _buildSvgImage(_currentBackground),
        ),
      );
    }

    // For religion changes, use the existing entrance animation
    return _buildEntranceAnimation(
      isBuddhism: isBuddhism,
      isCatholicism: isCatholicism,
      entranceInterval: entranceInterval,
    );
  }

  Widget _buildExitAnimation({
    required bool isCurrentCatholicism,
    required bool isCurrentBuddhism,
  }) {
    return FadeTransition(
      opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut,
        ),
      ),
      child: isCurrentCatholicism
          ? SlideTransition(
              position: _buildCatholicExitSequence().animate(_controller),
              child: _buildSvgImage(_currentBackground),
            )
          : isCurrentBuddhism
              ? SlideTransition(
                  position: _buildBuddhaExitSequence().animate(_controller),
                  child: _buildSvgImage(_currentBackground),
                )
              : _buildSvgImage(_currentBackground),
    );
  }

  Widget _buildEntranceAnimation({
    required bool isBuddhism,
    required bool isCatholicism,
    required Interval entranceInterval,
  }) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: entranceInterval,
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: _getEntranceOffset(isBuddhism, isCatholicism),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: entranceInterval,
          ),
        ),
        child: _buildSvgImage(_nextBackground),
      ),
    );
  }

  Widget _buildSvgImage(String assetPath) {
    return SvgPicture.asset(
      assetPath,
      allowDrawingOutsideViewBox: true,
      fit: BoxFit.contain,
      width: double.infinity,
    );
  }
}
