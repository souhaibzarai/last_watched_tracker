import 'package:flutter/cupertino.dart';

import '../../../utils/theme/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.size = 17,
    this.fw = FontWeight.w400,
    this.color = AppColors.textColor,
  });

  final String text;
  final double size;
  final FontWeight? fw;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: size, color: color, fontWeight: fw),
    );
  }
}
