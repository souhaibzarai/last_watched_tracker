import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
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
          padding: EdgeInsets.all(8),
          child: Icon(CupertinoIcons.back, color: AppColors.textColor),
        ),
      ),
    );
  }
}
