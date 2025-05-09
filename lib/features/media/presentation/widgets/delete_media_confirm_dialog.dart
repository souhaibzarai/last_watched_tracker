import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_watched_tracker/utils/constants/constants.dart';

import '../../../../common/widgets/blured_bg_preview.dart';
import '../../../../utils/messages/message_en.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import 'custom_dialog_text_button.dart';
import 'dialog_title.dart';

class DeleteMediaConfirmDialog extends StatelessWidget {
  const DeleteMediaConfirmDialog({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      backgroundColor: AppColors.secondaryTextColor,
      child: BluredBgPreview(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Dialog title
            DialogTitle(media: media),
            // Dialog content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                CommonMessagesEn.confirmMediaDeletion(media.title),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomDialogTextButton(
                    bgColor: AppColors.secondaryTextColor,
                    color: AppColors.textColor,
                    onPressed: () {
                      context.pop(false);
                    },
                    text: 'Cancel',
                  ),
                  AppConstants.horizontalSmallSizedBox,
                  CustomDialogTextButton(
                    onPressed: () {
                      context.pop(true);
                    },
                    text: 'Yes',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
