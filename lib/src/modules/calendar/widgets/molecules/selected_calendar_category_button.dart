import 'package:flutter/material.dart';
import 'package:aries/aries.dart';

class SelectedCalendarCategoryButton extends StatelessWidget {
  const SelectedCalendarCategoryButton({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? AriesColor.yellowP200 : AriesColor.neutral30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            Spacing.sp4,
            Text(
              label,
              style: AriesTextStyles.textBodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
