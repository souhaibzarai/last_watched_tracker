import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/colors/colors.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import 'media_text_preview.dart';

class ScrollableMediaDetailsSection extends StatelessWidget {
  const ScrollableMediaDetailsSection({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MediaTextPreview(
            text: media.category,
            color: AppColors.primaryColor,
            bgColor: AppColors.infoColor,
          ),
          AppConstants.horizontalSmallSizedBox,
          MediaTextPreview(
            text: media.status,
            bgColor: ColorsHelper.getStatusColor(media.status),
          ),
        ],
      ),
    );
  }
}
