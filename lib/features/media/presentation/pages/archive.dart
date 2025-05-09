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
            floating: true,
            snap: true,
            backgroundColor: AppColors.previewTextBgColor,
            toolbarHeight: 70,
            automaticallyImplyLeading: false,
            flexibleSpace: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    width: .15,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(width: double.infinity),
                ),
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
