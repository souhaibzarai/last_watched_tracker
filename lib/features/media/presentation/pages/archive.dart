import 'package:flutter/material.dart';

import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../home/presentation/widgets/medias.dart';
import '../widgets/archive_message.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: BackButton(color: AppColors.secondaryColor),
          ),
          ArchiveMessage(),
          Expanded(child: Medias(isArchived: true)),
        ],
      ),
    );
  }
}
