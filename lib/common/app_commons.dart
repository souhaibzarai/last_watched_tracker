import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';
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
      width: 40,
      height: 40,
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

  static Widget labeledProgressIndicator({String? label, Color? color}) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.disabledColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(25),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.textColor),
                strokeWidth: 3,
                backgroundColor: AppColors.primaryColor.withAlpha(100),
              ),
            ),
            AppConstants.horizontalSmallSizedBox,
            Text(
              label ?? 'Loading...',
              style: TextStyle(
                color: color ?? AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
