import 'package:flutter/material.dart';

import '../../../../common/widgets/button/custom_back_button.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../home/presentation/widgets/medias.dart';
import '../widgets/archive_message.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      child: const Column(
        children: [
          CustomBackButton(),
          ArchiveMessage(),
          Expanded(child: Medias(isArchived: true)),
        ],
      ),
    );
  }
}
