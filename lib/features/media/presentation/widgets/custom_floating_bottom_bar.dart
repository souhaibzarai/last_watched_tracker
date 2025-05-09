import 'dart:ui';

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
import 'archive_media_button.dart' show ArchiveMediaButton;
import 'delete_media_confirm_dialog.dart';

class CustomFloatingBottomBar extends StatelessWidget {
  const CustomFloatingBottomBar({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
        border: Border.all(color: AppColors.textColor, width: 1.4),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
        child: ClipPath(
          clipBehavior: Clip.hardEdge,
          clipper: MyCustomClipper(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class CustomFloatingBNBActions extends StatelessWidget {
  const CustomFloatingBNBActions({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ArchiveMediaButton(media: media),
        CustomMediaDetailsButton(
          icon: Icons.edit,
          onPressed: () {},
          color: AppColors.textColor,
        ),
        CustomMediaDetailsButton(
          icon: CupertinoIcons.share,
          onPressed: () {},
          color: AppColors.textColor,
        ),
        BlocProvider<DeleteMediaCubit>(
          create: (context) => DeleteMediaCubit(),
          lazy: true,
          child: BlocListener<DeleteMediaCubit, DeleteMediaState>(
            listener: (context, state) {
              if (state is MediaDeleteFailed) {
                return AppCommons.showScaffold(context, message: state.err);
              } else if (state is MediaDeleteSuccess) {
                context.read<FetchMediasCubit>().fetchMedias();
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
        ),
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();

    path.moveTo(30, size.height - 30);
    path.lineTo(10, 0);
    path.lineTo(size.width, 10);
    path.lineTo(40, size.width);
    path.lineTo(180, size.height);
    path.lineTo(0, size.width);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
