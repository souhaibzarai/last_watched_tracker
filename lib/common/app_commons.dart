import 'package:flutter/material.dart';

import '../utils/theme/app_colors.dart';

class AppCommons {
  const AppCommons._();

  static void showScaffold(BuildContext context, {required String message}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (message == '') {
        return;
      }
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
    });
  }

  static Widget centerProgressIndicator = Center(
    child: Container(
      width: 35,
      height: 35,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withAlpha(170),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.warningColor),
        strokeWidth: 3.0,
        backgroundColor: AppColors.primaryColor.withAlpha(100),
      ),
    ),
  );

  static OutlineInputBorder getOutlineInputBorder({
    Color? color,
    double? radiusSize,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radiusSize ?? 4),
      borderSide: BorderSide(color: color ?? AppColors.infoColor),
    );
  }
}
