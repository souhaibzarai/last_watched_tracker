import 'package:flutter/material.dart';

import '../../common/app_commons.dart';
import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData theme = ThemeData().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryColor,
    textTheme: TextTheme()
        .copyWith(
          displayLarge: getTextStyle(fSize: 57),
          displayMedium: getTextStyle(fSize: 45),
          displaySmall: getTextStyle(fSize: 36),
          headlineLarge: getTextStyle(fSize: 32),
          headlineMedium: getTextStyle(fSize: 28),
          headlineSmall: getTextStyle(fSize: 24),
          titleLarge: getTextStyle(fSize: 22),
          titleMedium: getTextStyle(fSize: 16),
          titleSmall: getTextStyle(fSize: 14),
          bodyLarge: getTextStyle(fSize: 16),
          bodyMedium: getTextStyle(fSize: 14),
          bodySmall: getTextStyle(fSize: 12),
          labelLarge: getTextStyle(fSize: 14),
          labelMedium: getTextStyle(fSize: 12),
          labelSmall: getTextStyle(fSize: 11),
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
      constraints: const BoxConstraints(maxHeight: 80),
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
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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

TextStyle getTextStyle({Color? color, double? fSize}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: fSize ?? 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'mainFont',
    letterSpacing: 0,
    wordSpacing: 0,
  );
}
