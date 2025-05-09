import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../domain/usecases/delete_media.dart';
import 'delete_media_state.dart';

class DeleteMediaCubit extends Cubit<DeleteMediaState> {
  DeleteMediaCubit() : super(MediaDeleteInitial());

  void deleteMedia(String id) async {
    try {
      final response = await serviceLocator<DeleteMediaUseCase>().call(
        params: id,
      );

      response.fold(
        (error) {
          emit(MediaDeleteFailed(err: error.toString()));
        },
        (success) {
          emit(MediaDeleteSuccess());
        },
      );
    } catch (e) {
      emit(MediaDeleteFailed(err: e.toString()));
    }
  }
}
