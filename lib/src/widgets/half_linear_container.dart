import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:religion_calendar_app/src/widgets/models/linear_first_section_ratio.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class HalfLinearContainer extends StatelessWidget {
  const HalfLinearContainer({
    super.key,
    required this.child,
    this.firstSectionRatio,
    this.imagePath,
  });

  final Widget child;
  final LinearFirstSectionRatio? firstSectionRatio;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final isHasImageInput = imagePath != null;
    final ratio =
        firstSectionRatio?.ratio ?? LinearFirstSectionRatio.defaultSized.ratio;

    return Scaffold(
      body: GradientBackground(
        child: LayoutBuilder(
          builder: (
            context,
            constraints,
          ) {
            final screenHeight = constraints.maxHeight;
            final firstSectionHeight = screenHeight * ratio;
            final secondSectionHeight = screenHeight - firstSectionHeight;
            final beginAlignment = firstSectionRatio?.beginAlignment ??
                LinearFirstSectionRatio.defaultSized.beginAlignment;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: firstSectionHeight,
                  child: Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: isHasImageInput
                        ? Image.asset(imagePath!)
                        : SvgPicture.asset(
                            AriesIcons.sunAndMoonImageIcon,
                          ),
                  ),
                ),
                SizedBox(
                  height: secondSectionHeight,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: beginAlignment,
                        end: Alignment.bottomCenter,
                        colors: [
                          AriesColor.neutral0.withOpacity(0),
                          AriesColor.neutral0,
                        ],
                        stops: const [0, 0.1],
                      ),
                    ),
                    child: child,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
