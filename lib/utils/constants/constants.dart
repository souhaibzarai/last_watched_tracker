import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppConstants {
  AppConstants._();

  static const EdgeInsetsGeometry padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 20,
  );
  static const border = Radius.circular(15);

  static VerticalDivider getVerticalDivider({bool isTransparent = false}) {
    return VerticalDivider(
      indent: 20,
      thickness: .8,
      width: isTransparent ? 15 : 1,
      color: isTransparent ? Colors.transparent : AppColors.buttonBgColor,
    );
  }

  static Divider getHorizontalDivider({bool isTransparent = true}) {
    return Divider(
      indent: 20,
      thickness: .8,
      height: isTransparent ? 10 : 1,
      endIndent: 20,
      color: isTransparent ? Colors.transparent : AppColors.buttonBgColor,
    );
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static const Widget verySmallSizedBox = SizedBox(height: 5);

  static const Widget smallSizedBox = SizedBox(height: 10);

  static const Widget mediumSizedBox = SizedBox(height: 15);

  static const Widget largeSizedBox = SizedBox(height: 25);
}
