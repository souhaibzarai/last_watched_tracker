import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class CustomAppScaffold extends StatelessWidget {
  const CustomAppScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(color: AppColors.primaryColor),
          child: child,
        ),
      ),
    );
  }
}
