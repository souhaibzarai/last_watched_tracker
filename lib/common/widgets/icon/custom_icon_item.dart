import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/theme/app_colors.dart';
import '../../app_commons.dart';

class CustomIconItem extends StatelessWidget {
  const CustomIconItem({
    super.key,
    this.onTap,
    this.icon,
    this.size = 28,
    this.color,
    this.radius = 10,
  });
  final VoidCallback? onTap;
  final IconData? icon;
  final double size;
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius).r,
      onTap:
          onTap ??
          () {
            AppCommons.showScaffold(context, message: 'Icon Clicked');
          },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius).r,
        ),
        child: Icon(
          icon ?? CupertinoIcons.settings,
          color: color ?? AppColors.textColor,
          size: size.sp,
        ),
      ),
    );
  }
}
