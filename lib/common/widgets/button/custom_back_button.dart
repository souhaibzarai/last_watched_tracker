import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: const BackButton(
        color: AppColors.secondaryColor,
        style: ButtonStyle(),
      ),
    );
  }
}
