import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class CustomMediaDetailsButton extends StatelessWidget {
  const CustomMediaDetailsButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.bgColor = Colors.transparent,
    this.color = AppColors.textColor,
    this.size = 30,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.hardEdge,
      color: bgColor,
      child: InkWell(
        focusColor: Colors.transparent,
        splashColor: AppColors.secondaryColor.withAlpha(1),
        highlightColor: Colors.transparent,
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: color, size: size),
        ),
      ),
    );
  }
}
