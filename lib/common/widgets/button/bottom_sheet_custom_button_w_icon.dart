import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/theme/app_colors.dart';
import '../image/custom_image_asset.dart';

class BottomSheetCustomButtonWIcon extends StatelessWidget {
  const BottomSheetCustomButtonWIcon({
    super.key,
    required this.path,
    this.height = 32,
    required this.title,
    this.fSize = 20,
    required this.colors,
    required this.onPressed,
    this.color,
  });

  final String path;
  final String title;
  final double height;
  final double fSize;
  final List<Color> colors;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5).r,
      child: InkWell(
        splashColor: AppColors.secondaryColor,
        enableFeedback: false,
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20).r,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20).r,
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: fSize.sp)),
              CustomImageAsset(
                height: height.h,
                path: path,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
