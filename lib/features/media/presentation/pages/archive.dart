import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../common/widgets/button/sliver_back_button.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../home/presentation/widgets/medias.dart';
import '../widgets/archive_message.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          const SliverBackButton(),
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.previewTextBgColor,
            collapsedHeight: 60,
            toolbarHeight: 60,
            expandedHeight: 80,
            automaticallyImplyLeading: false,
            flexibleSpace: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 20),
                child: Container(width: double.infinity),
              ),
            ),
            title: ArchiveMessage(),
          ),
          SliverToBoxAdapter(
            child: Medias(
              isArchived: true,
              scrollPhysics: NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
