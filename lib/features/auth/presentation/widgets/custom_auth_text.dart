import 'package:flutter/material.dart';

import '../../../../utils/theme/app_colors.dart';

class CustomAuthText extends StatelessWidget {
  const CustomAuthText({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 24, //
            color: AppColors.textColor,
          ),
        ),
        Text(
          subTitle,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
