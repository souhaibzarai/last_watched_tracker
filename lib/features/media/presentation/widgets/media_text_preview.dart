import 'package:flutter/widgets.dart';

import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/theme/app_colors.dart';

class MediaTextPreview extends StatelessWidget {
  const MediaTextPreview({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.disabledColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: CustomText(text, size: 14),
    );
  }
}
