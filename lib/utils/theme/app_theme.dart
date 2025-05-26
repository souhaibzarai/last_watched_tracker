import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_commons.dart';
import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData theme = ThemeData().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryColor,
    textTheme: TextTheme()
        .copyWith(
          displayLarge: getTextStyle(fSize: 57.sp),
          displayMedium: getTextStyle(fSize: 45.sp),
          displaySmall: getTextStyle(fSize: 36.sp),
          headlineLarge: getTextStyle(fSize: 32.sp),
          headlineMedium: getTextStyle(fSize: 28.sp),
          headlineSmall: getTextStyle(fSize: 24.sp),
          titleLarge: getTextStyle(fSize: 22.sp),
          titleMedium: getTextStyle(fSize: 16.sp),
          titleSmall: getTextStyle(fSize: 14.sp),
          bodyLarge: getTextStyle(fSize: 16.sp),
          bodyMedium: getTextStyle(fSize: 14.sp),
          bodySmall: getTextStyle(fSize: 12.sp),
          labelLarge: getTextStyle(fSize: 14.sp),
          labelMedium: getTextStyle(fSize: 12.sp),
          labelSmall: getTextStyle(fSize: 11.sp),
        )
        .apply(
          bodyColor: AppColors.textColor,
          displayColor: AppColors.textColor,
        ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(fontFamily: 'mainFont'),
        ),
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme().copyWith(
      constraints: BoxConstraints(maxHeight: 80.h),
      border: AppCommons.getOutlineInputBorder(),
      enabledBorder: AppCommons.getOutlineInputBorder(),
      errorBorder: AppCommons.getOutlineInputBorder(
        color: AppColors.errorColor,
      ),
      focusedBorder: AppCommons.getOutlineInputBorder(
        color: AppColors.successColor,
      ),
      fillColor: AppColors.primaryColor,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ).r,
      hintStyle: getTextStyle(color: AppColors.textColor),
      labelStyle: getTextStyle(color: AppColors.textColor),
      errorStyle: getTextStyle(color: AppColors.errorColor),
    ),

    listTileTheme: ListTileThemeData(
      textColor: AppColors.textColor,
      iconColor: AppColors.textColor,
    ),

    drawerTheme: DrawerThemeData(backgroundColor: AppColors.primaryColor),
  );
}

TextStyle getTextStyle({Color? color, double fSize = 15}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: fSize.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'mainFont',
    letterSpacing: 0,
    wordSpacing: 0,
  );
}
