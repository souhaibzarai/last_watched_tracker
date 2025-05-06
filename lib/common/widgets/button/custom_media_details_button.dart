import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class CustomMediaDetailsButton extends StatelessWidget {
  const CustomMediaDetailsButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.bgColor = AppColors.disabledColor,
    this.color = AppColors.textColor,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(icon, color: color, size: 30),
      ),
    );
  }
}
