import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../app_commons.dart';
import '../../../utils/theme/app_colors.dart';

class CustomIconItem extends StatelessWidget {
  const CustomIconItem({
    super.key,
    this.onTap,
    this.icon,
    this.size,
    this.color,
    this.radius = 10,
  });
  final VoidCallback? onTap;
  final IconData? icon;
  final double? size;
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap:
          onTap ??
          () {
            AppCommons.showScaffold(context, message: 'Icon Clicked');
          },
      child: Container(
        clipBehavior: Clip.hardEdge, //
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
        child: Icon(
          icon ?? CupertinoIcons.settings,
          color: color ?? AppColors.textColor,
          size: size ?? 28, //
        ),
      ),
    );
  }
}
