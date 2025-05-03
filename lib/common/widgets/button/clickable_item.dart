import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/theme/app_colors.dart';

class ClickableItem extends StatelessWidget {
  const ClickableItem({
    super.key,
    required this.onPressed,
    required this.text,
    this.iconSize,
    this.textSize,
    this.color,
    this.icon,
    this.padding,
  });

  final VoidCallback? onPressed;
  final String text;
  final double? iconSize;
  final double? textSize;
  final Color? color;
  final IconData? icon;
  final EdgeInsets? padding;

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
          padding:
              padding ?? EdgeInsets.symmetric(vertical: 14, horizontal: 25),
          child: Row(
            children: [
              Icon(
                icon ?? CupertinoIcons.archivebox,
                color: color ?? AppColors.textColor,
                size: iconSize ?? 18,
              ),
              AppConstants.horizontalMediumSizedBox,
              Text(
                text,
                style: TextStyle(
                  color: color ?? AppColors.textColor,
                  fontSize: textSize ?? 15,
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
