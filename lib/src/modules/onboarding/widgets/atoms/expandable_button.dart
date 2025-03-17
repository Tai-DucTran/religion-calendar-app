import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpandableButton extends StatefulWidget {
  final String iconPath;
  final String text;
  final Color color;
  final bool isExpanded;
  final VoidCallback onTap;

  const ExpandableButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.color,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  State<ExpandableButton> createState() => _ExpandableButtonState();
}

class _ExpandableButtonState extends State<ExpandableButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _widthAnimation = Tween<double>(
      begin: 60.0, // Circle width
      end: 200.0, // Increased expanded width to accommodate content
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Set initial expansion state
    if (widget.isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(ExpandableButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Animate when isExpanded changes
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedBackgroundColor =
        widget.isExpanded ? AriesColor.yellowP900 : AriesColor.neutral75;

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: _widthAnimation.value,
            height: 60.0,
            decoration: BoxDecoration(
              color: selectedBackgroundColor,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: selectedBackgroundColor.withValues(
                    alpha: 0.4,
                  ),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Icon (visible in circle state)
                Opacity(
                  opacity: 1.0 - _controller.value,
                  child: SvgPicture.asset(
                    widget.iconPath,
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      AriesColor.neutral900,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                // Text (visible in expanded state)
                Opacity(
                  opacity: _controller.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            widget.text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              decoration: TextDecoration.none,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Spacing.sp4,
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
