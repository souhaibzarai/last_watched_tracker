import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/constants.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';

class MediaNotes extends StatelessWidget {
  const MediaNotes({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.smallPadding,
      child: Text.rich(
        textAlign: TextAlign.justify,
        TextSpan(
          style: TextStyle(color: AppColors.textColor, fontSize: 14.sp),
          children: [
            const TextSpan(
              text: '➾ ',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryColor,
              ),
            ),
            TextSpan(text: media.notes!),
          ],
        ),
      ),
    );
  }
}
