import 'package:flutter/material.dart';

import '../../../../utils/theme/app_colors.dart';

class CustomDialogTextButton extends StatelessWidget {
  const CustomDialogTextButton({
    super.key,
    this.text = 'Yes',
    this.onPressed,
    this.bgColor = AppColors.errorColor,
    this.color = AppColors.primaryColor,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color bgColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.hardEdge,
      color: bgColor,
      child: InkWell(
        enableFeedback: false,
        highlightColor: AppColors.primaryColor.withAlpha(80),
        splashColor: AppColors.primaryColor.withAlpha(120),
        focusColor: Colors.transparent,
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          child: Text(text, style: TextStyle(color: color)),
        ),
      ),
    );
  }
}
