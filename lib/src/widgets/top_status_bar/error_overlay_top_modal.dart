import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorOverlayTopModal extends StatelessWidget {
  const ErrorOverlayTopModal({
    super.key,
    required this.errorTitle,
    required this.errorMessage,
    this.onClose,
    required this.isErrorOverlay,
  });

  final String errorTitle;
  final String errorMessage;
  final VoidCallback? onClose;
  final bool isErrorOverlay;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).viewInsets.top + 80,
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isErrorOverlay ? AriesColor.danger50 : Colors.white,
            borderRadius: BorderRadius.circular(
              12,
            ),
            boxShadow: [
              BoxShadow(
                color: isErrorOverlay
                    ? AriesColor.danger75
                    : Colors.black.withOpacity(
                        0.25,
                      ),
                offset: isErrorOverlay ? Offset.zero : const Offset(0, 4),
                blurRadius: isErrorOverlay ? 0 : 4,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isErrorOverlay
                  ? SvgPicture.asset(
                      AriesIcons.alertCircleOutlineIcon,
                      height: 20,
                      width: 20,
                    )
                  : Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x1A101828),
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        AriesIcons.googleIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      errorTitle,
                      style: TextStyle(
                        color: isErrorOverlay
                            ? AriesColor.danger300
                            : AriesColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      errorMessage,
                      style: TextStyle(
                        color: isErrorOverlay
                            ? AriesColor.danger300
                            : AriesColor.black,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.topRight,
                icon: Icon(
                  Icons.close,
                  color: isErrorOverlay
                      ? AriesColor.danger200
                      : AriesColor.neutral300,
                ),
                onPressed: onClose,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
