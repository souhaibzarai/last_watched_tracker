import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../image/custom_image_asset.dart';

import '../../../utils/theme/app_colors.dart';

class CustomImgIconButton extends StatelessWidget {
  const CustomImgIconButton({
    super.key,
    required this.path,
    this.color = AppColors.infoColor,
    this.bgColor = AppColors.previewTextBgColor,
    this.padding = const EdgeInsets.all(5),
    this.onPressed,
  });
  final String path;
  final Color color;
  final Color bgColor;
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      enableFeedback: false,
      splashColor: AppColors.buttonBgColor,
      highlightColor: AppColors.previewTextBgColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: padding.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
          border: Border.all(width: 1, color: AppColors.infoColor),
        ),
        child: CustomImageAsset(path: path, color: color),
      ),
    );
  }
}
