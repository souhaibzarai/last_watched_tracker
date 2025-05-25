import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/theme/app_colors.dart';

class CustomClickableField extends StatelessWidget {
  const CustomClickableField({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10).r,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          const BorderSide(color: AppColors.infoColor, width: 1),
        ),
        borderRadius: BorderRadius.circular(4).r,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.infoColor,
          ),
        ],
      ),
    );
  }
}
