import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import '../../../utils/theme/app_colors.dart';
import '../button/custom_clickable_field.dart';

class CustomDialogBottomSheet extends StatelessWidget {
  const CustomDialogBottomSheet({
    super.key,
    required this.text,
    required this.type,
    required this.child,
  });

  final String text;
  final String type;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (dialogContext) {
            return CupertinoAlertDialog(
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        text.toLowerCase().contains('choose')
                            ? text
                            : '$type: $text',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(dialogContext),
                        child: const Icon(
                          CupertinoIcons.xmark_circle_fill,
                          color: AppColors.textColor,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  AppConstants.verticalMediumSizedBox,
                  AppConstants.getHorizontalDivider(
                    isTransparent: false,
                    isFull: true,
                    color: AppColors.secondaryColor,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * .2,
                    ),
                    child: child,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: CustomClickableField(text: text),
    );
  }
}
