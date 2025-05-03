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
      color: isTransparent ? Colors.transparent : AppColors.disabledColor,
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
      height: isTransparent ? 10 : 1,
      endIndent: 20,
      color:
          isTransparent ? Colors.transparent : color ?? AppColors.buttonBgColor,
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

  static const Widget horizontalVerySmallSizedBox = SizedBox(height: 5);
  static const Widget verticalVerySmallSizedBox = SizedBox(height: 5);

  static const Widget horizontalSmallSizedBox = SizedBox(width: 10);
  static const Widget verticalSmallSizedBox = SizedBox(height: 10);

  static const Widget horizontalMediumSizedBox = SizedBox(width: 15);
  static const Widget verticalMediumSizedBox = SizedBox(height: 15);

  static const Widget horizontalLargeSizedBox = SizedBox(width: 25);
  static const Widget verticalLargeSizedBox = SizedBox(height: 25);
}
