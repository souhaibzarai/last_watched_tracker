import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/cubit/button/button_state.dart';
import '../../../../common/cubit/button/button_state_cubit.dart';
import '../../../../common/widgets/button/custom_back_button.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/page_heading_title.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/messages/message_en.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../category/presentation/cubit/category_selector_cubit.dart';
import '../../../category/presentation/widgets/category_selector_field.dart';
import '../../../status/presentation/cubit/status_selector_cubit.dart';
import '../../../status/presentation/widgets/status_selector_field.dart';
import '../cubit/upload_image_cubit.dart';
import '../widgets/add_media_button.dart';

class AddMediaPage extends StatefulWidget {
  const AddMediaPage({super.key});

  @override
  State<AddMediaPage> createState() => _AddMediaPageState();
}

class _AddMediaPageState extends State<AddMediaPage> {
  late TextEditingController titleController;
  late TextEditingController progressController;
  late TextEditingController totalController;
  late TextEditingController notesController;

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    titleController = TextEditingController(text: 'Kingdom');
    progressController = TextEditingController(text: '830');
    totalController = TextEditingController();

    notesController = TextEditingController(text: 'Kingdom');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    progressController.dispose();
    totalController.dispose();
    notesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      child: Column(
        children: [
          const CustomBackButton(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => ButtonStateCubit(),
                    lazy: true,
                  ),
                  BlocProvider(
                    create: (context) => UploadImageCubit(),
                    lazy: true,
                  ),
                ],
                child: BlocListener<ButtonStateCubit, ButtonState>(
                  listener: (context, state) {
                    if (state is FailureButtonState) {
                      return AppCommons.showScaffold(
                        context,
                        message: state.errMsg,
                      );
                    }
                    if (state is SuccessButtonState) {
                      context.pop(true);
                      return AppCommons.showScaffold(
                        context,
                        message: CommonMessagesEn.mediaCreated,
                      );
                    }
                  },
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const PageHeadingTitle(text: 'Add New Media'),
                        AppConstants.verticalLargeSizedBox,
                        CustomTextField(
                          labelText: 'Title',
                          controller: titleController,
                        ),
                        AppConstants.verticalMediumSizedBox,
                        CategorySelectorField(),
                        AppConstants.verticalMediumSizedBox,
                        StatusSelectorField(),
                        AppConstants.verticalMediumSizedBox,
                        CustomTextField(
                          labelText: 'Progress',
                          hintText: 'Current episodes, chapters, or pages',
                          controller: progressController,
                          isNumber: true,
                          keyboardType: TextInputType.number,
                        ),
                        AppConstants.verticalMediumSizedBox,
                        CustomTextField(
                          labelText: 'Total (Optional)',
                          hintText: 'Total episodes, chapters, or pages',
                          controller: totalController,
                          isNumber: true,
                          isOptional: true,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            if (!RegExp(r'^\d+$').hasMatch(value)) {
                              return 'Please enter a valid number';
                            }
                            if (int.parse(progressController.text) >
                                int.parse(totalController.text)) {
                              return 'Total cannot be lower than progress';
                            }
                            return null;
                          },
                        ),
                        AppConstants.verticalMediumSizedBox,
                        BlocBuilder<UploadImageCubit, XFile?>(
                          builder: (context, image) {
                            return InkWell(
                              onTap: () async {
                                await context
                                    .read<UploadImageCubit>()
                                    .pickImageFromGallery();
                              },
                              enableFeedback: false,
                              borderRadius: BorderRadius.circular(4).r,
                              child: Container(
                                width: double.infinity,
                                height: 150.h,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: AppColors.previewTextBgColor.withAlpha(
                                    150,
                                  ),
                                  borderRadius: BorderRadius.circular(4).r,
                                ),
                                child: image == null
                                    ? Icon(
                                        CupertinoIcons.camera_fill,
                                        color: AppColors.infoColor,
                                        size: 30.sp,
                                      )
                                    : Image.file(
                                        File(image.path),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            );
                          },
                        ),
                        AppConstants.verticalMediumSizedBox,
                        CustomTextField(
                          labelText: 'Notes (Optional)',
                          hintText: 'Add any personal notes about this media',
                          isDescriptive: true,
                          controller: notesController,
                          isOptional: true,
                        ),
                        AppConstants.verticalLargeSizedBox,
                        AddMediaButton(
                          formKey: _formKey,
                          titleController: titleController,
                          progressController: progressController,
                          totalController: totalController,
                          notesController: notesController,
                          category: context
                              .watch<CategorySelectorCubit>()
                              .state,
                          status: context.watch<StatusSelectorCubit>().state,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
