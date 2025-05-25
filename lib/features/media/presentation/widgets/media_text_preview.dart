import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2).r,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25).r,
      ),
      child: CustomText(text, size: 13.sp, color: color),
    );
  }
}
