import 'package:flutter/material.dart';

import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/helpers/numbers/percentage_helper.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';

class MediaPreviewStatus extends StatelessWidget {
  const MediaPreviewStatus({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 1.5,
            child: CustomText(
              media.status,
              color: AppColors.secondaryColor,
              size: 14,
            ),
          ),
        ),
        const Spacer(),
        CustomText(
          '${PercentageHelper.getPercentage(media.progress, media.total)}%',
          size: 12,
          fw: FontWeight.w300,
          color: AppColors.textColor,
        ),
      ],
    );
  }
}
