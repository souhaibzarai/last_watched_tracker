import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/widgets/button/custom_media_details_button.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import '../cubit/delete_media_cubit.dart';
import '../cubit/delete_media_state.dart';
import '../cubit/fetch_medias_cubit.dart';
import 'delete_media_confirm_dialog.dart';

class DeleteMediaButton extends StatelessWidget {
  const DeleteMediaButton({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteMediaCubit>(
      create: (context) => DeleteMediaCubit(),
      lazy: true,
      child: BlocListener<DeleteMediaCubit, DeleteMediaState>(
        listener: (context, state) {
          if (state is MediaDeleteFailed) {
            return AppCommons.showScaffold(context, message: state.err);
          } else if (state is MediaDeleteSuccess) {
            context.read<FetchMediasCubit>().fetchMedias(showLoading: false);
            context.pop();
          }
        },
        child: Builder(
          builder: (context) {
            return CustomMediaDetailsButton(
              icon: CupertinoIcons.delete,
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (dContext) {
                    return DeleteMediaConfirmDialog(media: media);
                  },
                );
                if (result == true && context.mounted) {
                  context.read<DeleteMediaCubit>().deleteMedia(media.id);
                }
              },
              color: AppColors.textColor,
            );
          },
        ),
      ),
    );
  }
}
