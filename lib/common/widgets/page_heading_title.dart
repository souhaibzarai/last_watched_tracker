import 'package:flutter/cupertino.dart';

import '../../utils/theme/app_colors.dart';

class PageHeadingTitle extends StatelessWidget {
  const PageHeadingTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 24,
        color: AppColors.textColor,
      ),
    );
  }
}
