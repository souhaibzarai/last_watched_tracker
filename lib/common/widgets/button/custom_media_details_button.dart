import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class CustomMediaDetailsButton extends StatelessWidget {
  const CustomMediaDetailsButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.bgColor = AppColors.buttonBgColor,
    this.color = AppColors.primaryColor,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.hardEdge,
      color: bgColor,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.all(8),
          child: Icon(icon, color: color),
        ),
      ),
    );
  }
}
