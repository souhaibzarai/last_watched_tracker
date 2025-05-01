import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/theme/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.onChanged,
    this.hintText = 'Search...',
    this.borderRadius = 12.0,
    this.height = 50.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.backgroundColor,
    this.prefixIcon,
    this.suffixIcon,
    this.fontSize = 16.0,
  });

  final void Function(String)? onChanged;
  final String hintText;
  final double borderRadius;
  final double height;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.disabledColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.disabledColor.withAlpha(150),
            blurRadius: 100,
            offset: const Offset(4, 5),
          ),
        ],
      ),
      child: Padding(
        padding: padding,
        child: CupertinoSearchTextField(
          itemColor: AppColors.textColor,
          placeholderStyle: TextStyle(
            color: AppColors.textColor.withAlpha(180),
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
          ),
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: AppColors.textColor,
          onChanged: onChanged,
          placeholder: hintText,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          prefixIcon: prefixIcon ?? const Icon(CupertinoIcons.search),
          suffixIcon: Icon(CupertinoIcons.clear),
          backgroundColor: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius - 4),
        ),
      ),
    );
  }
}
