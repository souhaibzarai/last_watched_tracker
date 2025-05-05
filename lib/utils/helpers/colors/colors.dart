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
      case 'not started':
        return AppColors.secondaryColor;
      case 'on hold':
        return AppColors.disabledColor;
      case 'dropped':
        return AppColors.errorColor;
      default:
        return AppColors.disabledColor;
    }
  }
}
