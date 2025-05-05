import 'package:flutter/widgets.dart';

import '../../theme/app_colors.dart';

class ColorsHelper {
  ColorsHelper._();

  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return AppColors.successColor;
      case 'in progress':
        return AppColors.infoColor;
      case 'not started':
        return AppColors.secondaryColor;
      case 'on hold':
        return AppColors.warningColor;
      case 'dropped':
        return AppColors.errorColor;
      default:
        return AppColors.secondaryColor;
    }
  }
}
