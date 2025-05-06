import 'package:flutter/material.dart';
import 'package:last_watched_tracker/utils/theme/app_colors.dart';

import '../../../../utils/messages/message_en.dart';

class ArchiveMessage extends StatelessWidget {
  const ArchiveMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      CommonMessagesEn.mediaWillBeArchived,
      style: TextStyle(fontSize: 16, color: AppColors.textColor),
      maxLines: 2,
      softWrap: true,
      textAlign: TextAlign.center,
    );
  }
}
