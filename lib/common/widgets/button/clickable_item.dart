import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/constants.dart';
import '../../../utils/theme/app_colors.dart';

class ClickableItem extends StatelessWidget {
  const ClickableItem({
    super.key,
    required this.onPressed,
    required this.text,
    this.iconSize = 18,
    this.textSize = 15,
    this.color = AppColors.textColor,
    this.icon = CupertinoIcons.archivebox,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
  });

  final VoidCallback? onPressed;
  final String text;
  final double iconSize;
  final double textSize;
  final Color color;
  final IconData icon;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: AppColors.buttonBgColor.withAlpha(120),
        splashColor: AppColors.buttonBgColor.withAlpha(77),
        highlightColor: AppColors.buttonBgColor.withAlpha(52),
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          padding: padding.r,
          child: Row(
            children: [
              Icon(icon, color: color, size: iconSize.sp),
              AppConstants.horizontalMediumSizedBox,
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: textSize.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
