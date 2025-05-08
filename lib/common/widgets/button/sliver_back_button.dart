import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';
import 'custom_back_button.dart';

class SliverBackButton extends StatelessWidget {
  const SliverBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: CustomBackButton(),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
