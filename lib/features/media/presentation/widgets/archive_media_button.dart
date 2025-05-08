import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/button/custom_media_details_button.dart';
import '../../../../utils/helpers/functions/functions.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../data/models/archive.dart';
import '../../domain/entities/media.dart';
import '../cubit/check_archive_cubit.dart';

class ArchiveMediaButton extends StatelessWidget {
  const ArchiveMediaButton({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckArchiveCubit()..setArchiveStatus(media.isArchived),
      child: Builder(
        builder: (context) {
          return CustomMediaDetailsButton(
            bgColor: AppColors.previewTextBgColor,
            icon:
                context.watch<CheckArchiveCubit>().state == true
                    ? Icons.unarchive
                    : CupertinoIcons.archivebox_fill,
            onPressed: () {
              final checkCubit = context.read<CheckArchiveCubit>();
              final newStatus = checkCubit.state;
              FunctionsHelper.toggleArchive(
                context,
                ArchiveModel(id: media.id, status: newStatus),
              );
              checkCubit.setArchiveStatus(!newStatus);
            },
          );
        },
      ),
    );
  }
}
