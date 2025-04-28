import 'package:flutter/cupertino.dart';
import 'package:last_watched_tracker/utils/theme/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .9,
      child: CupertinoSearchTextField(
        itemColor: AppColors.textColor,
        cursorColor: AppColors.textColor,
        style: TextStyle(color: AppColors.textColor, fontSize: 18),
        onChanged: onChanged,
      ),
    );
  }
}
