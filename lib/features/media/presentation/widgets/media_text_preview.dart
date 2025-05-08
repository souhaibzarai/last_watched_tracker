import 'package:flutter/widgets.dart';

import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/theme/app_colors.dart';

class MediaTextPreview extends StatelessWidget {
  const MediaTextPreview({
    super.key,
    required this.text,
    this.bgColor = AppColors.primaryColor,
    this.color = AppColors.textColor,
  });

  final String text;
  final Color bgColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: CustomText(text, size: 13, color: color),
    );
  }
}
