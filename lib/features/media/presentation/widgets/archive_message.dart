import 'package:flutter/material.dart';
import 'package:last_watched_tracker/utils/messages/message_en.dart';
import 'package:last_watched_tracker/utils/theme/app_colors.dart';

class ArchiveMessage extends StatelessWidget {
  const ArchiveMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textColor.withAlpha(15), //
        border: Border.symmetric(
          horizontal: BorderSide(width: .1, color: AppColors.infoColor),
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
      child: Text(
        CommonMessagesEn.mediaWillBeArchived,
        textAlign: TextAlign.center,
      ),
    );
  }
}
