import 'package:flutter/material.dart';

import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/helpers/strings/string_helper.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';

class ChaptersTextCount extends StatelessWidget {
  const ChaptersTextCount({
    super.key,
    required this.media,
  });

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      StringHelper.getChaptersTextCount(
        media.progress,
        media.total,
      ),
      size: 12,
      color: AppColors.secondaryTextColor,
    );
  }
}
