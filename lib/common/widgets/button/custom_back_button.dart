import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.color = AppColors.textColor});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          onTap: () {
            if (context.canPop()) {
              context.pop();
            }
          },
          child: Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(8),
            child: Icon(CupertinoIcons.back, color: color),
          ),
        ),
      ),
    );
  }
}
