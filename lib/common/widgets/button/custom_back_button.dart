import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 8),
      alignment: Alignment.centerLeft,
      child: const BackButton(color: AppColors.secondaryColor),
    );
  }
}
