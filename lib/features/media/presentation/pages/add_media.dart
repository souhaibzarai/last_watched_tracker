import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/cubit/button/button_state.dart';
import '../../../../common/cubit/button/button_state_cubit.dart';
import '../../../../common/widgets/button/custom_reactive_button.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/messages/message_en.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import '../../domain/usecases/new_media.dart';

class AddMediaPage extends StatefulWidget {
  const AddMediaPage({super.key});

  @override
  State<AddMediaPage> createState() => _AddMediaPageState();
}

class _AddMediaPageState extends State<AddMediaPage> {
  late TextEditingController titleController;
  late TextEditingController progressController;
  late TextEditingController totalController;
  late TextEditingController imgUrlController;
  late TextEditingController notesController;

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    titleController = TextEditingController(text: 'Kingdom');
    progressController = TextEditingController(text: '830');
    totalController = TextEditingController();
    imgUrlController = TextEditingController(
      text: 'https://i.imgur.com/NSVz8Vx.png',
    );
    notesController = TextEditingController(text: 'Kingdom');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    progressController.dispose();
    totalController.dispose();
    imgUrlController.dispose();
    notesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: BackButton(color: AppColors.secondaryColor),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: BlocProvider(
              create: (context) => ButtonStateCubit(),
              lazy: true,
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
                      message: CommonMessagesEn.mediaCreatedSuccessfully,
                    );
                  }
                },
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Add New Media',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 24,
                          color: AppColors.textColor,
                        ),
                      ),
                      AppConstants.verticalLargeSizedBox,
                      CustomTextField(
                        labelText: 'Title',
                        controller: titleController,
                      ),
                      AppConstants.verticalMediumSizedBox,
                      DropdownButtonFormField(
                        decoration: InputDecoration(labelText: 'Category'),
                        icon: Icon(
                          CupertinoIcons.wand_stars,
                          color: AppColors.infoColor,
                        ),
                        dropdownColor: AppColors.disabledColor,
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                        ),
                        value: 'series',
                        itemHeight: 60,
                        items: const [
                          DropdownMenuItem(
                            value: 'movie',
                            child: Text('Movie'), //
                          ),
                          DropdownMenuItem(
                            value: 'series',
                            child: Text('TV Series'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                      AppConstants.verticalMediumSizedBox,
                      DropdownButtonFormField(
                        decoration: InputDecoration(labelText: 'Status'),
                        icon: Icon(
                          CupertinoIcons.wand_stars,
                          color: AppColors.infoColor,
                        ),
                        dropdownColor: AppColors.disabledColor,
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                        ),
                        itemHeight: 60,
                        items: const [
                          DropdownMenuItem(
                            value: 'onhold',
                            child: Text('On Hold'), //
                          ),
                          DropdownMenuItem(
                            value: 'inProgress',
                            child: Text('In Progress'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                      AppConstants.verticalMediumSizedBox,
                      CustomTextField(
                        labelText: 'Progress',
                        hintText: 'Current episodes, chapters, or pages',
                        controller: progressController,
                      ),
                      AppConstants.verticalMediumSizedBox,
                      CustomTextField(
                        labelText: 'Total (Optional)',
                        hintText: 'Total episodes, chapters, or pages',
                        controller: totalController,
                        isOptional: true,
                      ),
                      AppConstants.verticalMediumSizedBox,
                      CustomTextField(
                        labelText: 'Cover Image URL (Optional)',
                        hintText: 'Link to an image for this media',
                        controller: imgUrlController,
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
                      Builder(
                        builder: (context) {
                          return CustomReactiveButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await context.read<ButtonStateCubit>().execute(
                                  usecase: NewMediaUseCase(),
                                  params: MediaEntity(
                                    id: '',
                                    title: titleController.text,
                                    category: 'Anime',
                                    status: 'In Progress',
                                    imgUrl: imgUrlController.text,
                                    progress: progressController.text,
                                    total: totalController.text,
                                    notes: notesController.text,
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
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
