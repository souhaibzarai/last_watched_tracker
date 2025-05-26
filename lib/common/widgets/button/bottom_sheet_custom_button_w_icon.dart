import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_watched_tracker/common/widgets/image/custom_image_asset.dart';
import 'package:last_watched_tracker/utils/constants/images_path.dart';
import 'package:last_watched_tracker/utils/theme/app_colors.dart';

class BottomSheetCustomButtonWIcon extends StatelessWidget {
  const BottomSheetCustomButtonWIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        gradient: LinearGradient(
          colors: [
            AppColors.buttonBgColor.withAlpha(120),
            AppColors.infoColor.withAlpha(120),
            AppColors.secondaryColor.withAlpha(120),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Sign Out', style: TextStyle(fontSize: 18.sp)),
          CustomImageAsset(height: 38.h, path: ImagesPath.logoutIcon),
        ],
      ),
    );
  }
}
