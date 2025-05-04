import 'package:flutter/cupertino.dart';

import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/helpers/strings/percentage_helper.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';

class MediaPreviewStatus extends StatelessWidget {
  const MediaPreviewStatus({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      '${PercentageHelper.getPercentage(media.progress, media.total)}',
      size: 13,
      fw: FontWeight.w300,
      color: AppColors.infoColor,
    );
  }
}
