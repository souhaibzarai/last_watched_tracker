import 'package:flutter/widgets.dart';

import '../../theme/app_colors.dart';

class ColorsHelper {
  ColorsHelper._();

  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return AppColors.slidableGreenColor;
      case 'in progress':
        return AppColors.previewTextBgColor.withAlpha(255);
      case 'plan to watch/read':
        return AppColors.infoColor.withAlpha(160);
      case 'on hold':
        return AppColors.secondaryTextColor;
      case 'dropped':
        return AppColors.errorColor;
      default:
        return AppColors.secondaryTextColor;
    }
  }
}
