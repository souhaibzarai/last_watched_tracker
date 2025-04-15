import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class CustomAppScaffold extends StatelessWidget {
  const CustomAppScaffold({
    super.key,
    required this.child,
    required this.header,
  });
  final Widget child;
  final Widget header;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.disabledColor,
          child: Column(
            children: [
              header,
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), //
                      topRight: Radius.circular(20), //
                    ),
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
