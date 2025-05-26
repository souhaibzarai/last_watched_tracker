import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/cubit/button/button_state_cubit.dart';
import '../../../../common/widgets/button/custom_reactive_button.dart';
import '../../../../utils/messages/message_en.dart';
import '../../domain/entities/media.dart';
import '../../domain/usecases/new_media.dart';
import '../cubit/upload_image_cubit.dart';

class AddMediaButton extends StatelessWidget {
  const AddMediaButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.titleController,
    required this.progressController,
    required this.totalController,
    required this.notesController,
    required this.category,
    required this.status,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController titleController;
  final TextEditingController progressController;
  final TextEditingController totalController;
  final TextEditingController notesController;
  final String category;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return CustomReactiveButton(
          text: 'Add Media',
          onPressed:
              (category.toLowerCase().contains('choose') ||
                  status.toLowerCase().contains('choose'))
              ? null
              : () async {
                  MediaEntity newMedia = MediaEntity(
                    id: '',
                    title: titleController.text,
                    category: category,
                    status: status,
                    imgUrl: '',
                    progress: progressController.text,
                    total: totalController.text,
                    notes: notesController.text,
                  );
                  if (_formKey.currentState!.validate() && context.mounted) {
                    context.read<ButtonStateCubit>().setLoading();

                    final imageCubit = context.read<UploadImageCubit>();

                    if (imageCubit.state == null) {
                      context.read<ButtonStateCubit>().setIdle();
                      return AppCommons.showScaffold(
                        context,
                        message: CommonMessagesEn.noImageSelected,
                      );
                    }

                    final imgUrlResult = await imageCubit.getImageUrl(
                      imageCubit.pickedImage,
                    );

                    imgUrlResult.fold(
                      (err) {
                        return AppCommons.showScaffold(context, message: err);
                      },
                      (imgUrl) {
                        newMedia.imgUrl = imgUrl;
                      },
                    );

                    await context.read<ButtonStateCubit>().execute(
                      usecase: NewMediaUseCase(),
                      params: newMedia,
                    );
                  }
                },
        );
      },
    );
  }
}
