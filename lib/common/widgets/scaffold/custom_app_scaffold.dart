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
          decoration: BoxDecoration(color: AppColors.primaryColor),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: child,
        ),
      ),
    );
  }
}
