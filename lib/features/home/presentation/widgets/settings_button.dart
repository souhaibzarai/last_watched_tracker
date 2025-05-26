import 'package:flutter/material.dart';
import 'package:last_watched_tracker/common/widgets/button/bottom_sheet_custom_button_w_icon.dart';
import 'package:last_watched_tracker/utils/constants/images_path.dart';
import 'package:last_watched_tracker/utils/theme/app_colors.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetCustomButtonWIcon(
      path: ImagesPath.settingsIcon,
      title: 'Settings',
      colors: [
        AppColors.buttonBgColor.withAlpha(210),
        AppColors.secondaryColor.withAlpha(100),
        AppColors.infoColor.withAlpha(220),
      ],
      onPressed: () {},
    );
  }
}
