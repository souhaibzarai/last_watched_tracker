import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/cubit/button/button_state_cubit.dart';
import '../../../../common/widgets/button/custom_reactive_button.dart';
import '../../domain/entities/media.dart';
import '../../domain/usecases/new_media.dart';

class AddMediaButton extends StatelessWidget {
  const AddMediaButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.titleController,
    required this.imgUrlController,
    required this.progressController,
    required this.totalController,
    required this.notesController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController titleController;
  final TextEditingController imgUrlController;
  final TextEditingController progressController;
  final TextEditingController totalController;
  final TextEditingController notesController;

  @override
  Widget build(BuildContext context) {
    return Builder(
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
    );
  }
}
