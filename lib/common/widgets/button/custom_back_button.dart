import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.color = AppColors.textColor});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          enableFeedback: false,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ).r,
          onTap: () {
            if (context.canPop()) {
              context.pop();
            }
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            padding: const EdgeInsets.all(8).r,
            child: Icon(CupertinoIcons.back, color: color),
          ),
        ),
      ),
    );
  }
}
