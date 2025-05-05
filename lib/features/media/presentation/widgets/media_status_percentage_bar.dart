import 'package:flutter/material.dart';

import '../../../../utils/helpers/numbers/percentage_helper.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';

class MediaStatusPercentageBar extends StatelessWidget {
  const MediaStatusPercentageBar({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 5,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.secondaryTextColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: FractionallySizedBox(
          widthFactor:
              (PercentageHelper.getPercentage(media.progress, media.total) /
                  100),
          alignment: Alignment.centerLeft,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColors.textColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
