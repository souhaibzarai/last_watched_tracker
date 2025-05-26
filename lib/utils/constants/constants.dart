import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class AppConstants {
  AppConstants._();

  static final EdgeInsetsGeometry padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 20,
  ).r;

  static final smallPadding = EdgeInsets.all(8.0).r;

  static final border = Radius.circular(15).r;

  static VerticalDivider getVerticalDivider({bool isTransparent = false}) {
    return VerticalDivider(
      indent: 20,
      thickness: .8,
      width: isTransparent ? 15.w : 1,
      color: isTransparent ? Colors.transparent : AppColors.previewTextBgColor,
    );
  }

  static Divider getHorizontalDivider({
    bool isTransparent = true,
    bool isFull = false,
    Color? color,
  }) {
    return Divider(
      indent: isFull ? 0 : 20,
      thickness: isFull ? .4 : .8,
      height: isTransparent ? 10.h : 1,
      endIndent: isFull ? 0 : 20,
      color: isTransparent
          ? Colors.transparent
          : color ?? AppColors.buttonBgColor,
    );
  }

  static Divider getDialogDivider({double? indent, double? endIndent}) {
    return Divider(
      color: AppColors.warningColor,
      endIndent: endIndent ?? 0,
      indent: indent ?? 0,
      height: 8,
      thickness: .4,
    );
  }

  static Divider getMediaItemDivider() {
    return const Divider(
      indent: 68,
      thickness: .4,
      height: 1,
      color: AppColors.buttonBgColor,
    );
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static final Widget horizontalVerySmallSizedBox = SizedBox(width: 5.w);
  static final Widget verticalVerySmallSizedBox = SizedBox(height: 5.h);

  static final Widget horizontalSmallSizedBox = SizedBox(width: 10.w);
  static final Widget verticalSmallSizedBox = SizedBox(height: 10.h);

  static final Widget horizontalMediumSizedBox = SizedBox(width: 15.w);
  static final Widget verticalMediumSizedBox = SizedBox(height: 15.h);

  static final Widget horizontalLargeSizedBox = SizedBox(width: 25.w);
  static final Widget verticalLargeSizedBox = SizedBox(height: 25.h);
}
