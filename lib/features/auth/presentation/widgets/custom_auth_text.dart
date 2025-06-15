import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme/app_colors.dart';

class CustomAuthText extends StatelessWidget {
  const CustomAuthText({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 18.sp,
            color: AppColors.textColor,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(color: Colors.white70, fontSize: 14.sp),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
