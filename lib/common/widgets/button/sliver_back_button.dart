import 'package:flutter/material.dart';
import 'package:last_watched_tracker/common/widgets/button/custom_back_button.dart';
import 'package:last_watched_tracker/utils/theme/app_colors.dart';

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
