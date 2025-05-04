import 'package:flutter/cupertino.dart';

import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';

class MediaPreviewTitle extends StatelessWidget {
  const MediaPreviewTitle({
    super.key,
    required this.media,
  });

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: 1.5,
        child: CustomText(
          media.status,
          color: AppColors.secondaryColor,
          size: 14,
        ),
      ),
    );
  }
}
