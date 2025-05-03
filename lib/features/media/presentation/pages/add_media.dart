import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/cubit/button/button_state.dart';
import '../../../../common/cubit/button/button_state_cubit.dart';
import '../../../../common/widgets/button/custom_back_button.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/page_heading_title.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/messages/message_en.dart';
import '../../../category/presentation/cubit/category_selector_cubit.dart';
import '../../../category/presentation/widgets/category_selector_field.dart';
import '../../../status/presentation/cubit/status_selector_cubit.dart';
import '../../../status/presentation/widgets/status_selector_field.dart';
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
          const CustomBackButton(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
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
                          keyboardType: TextInputType.number,
                        ),
                        AppConstants.verticalMediumSizedBox,
                        CustomTextField(
                          labelText: 'Total (Optional)',
                          hintText: 'Total episodes, chapters, or pages',
                          controller: totalController,
                          isOptional: true,
                          keyboardType: TextInputType.number,
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
                        AddMediaButton(
                          formKey: _formKey,
                          titleController: titleController,
                          imgUrlController: imgUrlController,
                          progressController: progressController,
                          totalController: totalController,
                          notesController: notesController,
                          category: context.watch<CategorySelectorCubit>().state,
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
