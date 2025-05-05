import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/theme/app_colors.dart';

class BluredBgPreview extends StatelessWidget {
  const BluredBgPreview({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * .6,
          maxWidth: MediaQuery.of(context).size.width * .8,
        ),
        child: child,
      ),
    );
  }
}
