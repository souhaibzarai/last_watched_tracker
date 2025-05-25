import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8).r,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                'Delete ${media.title}',
                color: AppColors.textColor,
                fw: FontWeight.w300,
                size: 18.sp,
              ),
              Icon(Icons.warning, color: AppColors.warningColor, size: 17.sp),
            ],
          ),
          AppConstants.getDialogDivider(),
        ],
      ),
    );
  }
}
