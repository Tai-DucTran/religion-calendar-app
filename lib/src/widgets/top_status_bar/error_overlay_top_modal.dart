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
    this.icon,
  });

  final String errorTitle;
  final String errorMessage;
  final VoidCallback? onClose;
  final bool isErrorOverlay;
  final IconData? icon;

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
            border: isErrorOverlay
                ? Border.all(
                    color: AriesColor.danger75,
                    width: 1,
                  )
                : null,
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
          child: ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            dense: true,
            isThreeLine: true,
            minLeadingWidth: 12,
            minVerticalPadding: 0,
            leading: isErrorOverlay
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
                    child: (icon != null)
                        ? Icon(
                            icon,
                            size: 20,
                          )
                        : SvgPicture.asset(
                            AriesIcons.googleIcon,
                            height: 20,
                            width: 20,
                          ),
                  ),
            title: Text(
              errorTitle,
              style: TextStyle(
                color: isErrorOverlay ? AriesColor.danger300 : AriesColor.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              errorMessage,
              style: TextStyle(
                color: isErrorOverlay ? AriesColor.danger300 : AriesColor.black,
              ),
            ),
            trailing: GestureDetector(
              onTap: onClose,
              child: Padding(
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.close,
                  color: isErrorOverlay
                      ? AriesColor.danger200
                      : AriesColor.neutral300,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
