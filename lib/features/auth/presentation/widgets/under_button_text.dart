import 'package:flutter/material.dart';

import '../../../../utils/theme/app_colors.dart';

class UnderButtonText extends StatelessWidget {
  const UnderButtonText({
    super.key,
    required this.text,
    required this.clickableText,
    required this.onTextClick,
  });
  final String text;
  final String clickableText;
  final VoidCallback? onTextClick;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          Text(
            '$text ',
            softWrap: true,
            style: const TextStyle(
              fontSize: 12, //
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ), //
          GestureDetector(
            onTap: onTextClick,
            child: Text(
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              clickableText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ], //
      ),
    );
  }
}
