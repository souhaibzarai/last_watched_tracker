import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/messages/message_en.dart';
import '../../../../utils/theme/app_colors.dart';

class ArchiveMessage extends StatelessWidget {
  const ArchiveMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      CommonMessagesEn.mediaWillStayArchived,
      style: TextStyle(fontSize: 15.sp, color: AppColors.textColor),
      maxLines: 2,
      softWrap: true,
      textAlign: TextAlign.center,
    );
  }
}
