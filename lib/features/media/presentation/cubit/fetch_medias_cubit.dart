import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../domain/usecases/fetch_medias.dart';
import 'fetch_medias_state.dart';

class FetchMediasCubit extends Cubit<MediaState> {
  FetchMediasCubit() : super(MediaInitialState());

  Future<void> fetchMedias({bool showLoading = true}) async {
    if (showLoading) {
      emit(MediaLoadingState());
    }

    try {
      final returnedData = await serviceLocator<FetchMediasUseCase>().call();

      returnedData.fold(
        (err) {
          emit(MediaFailureState(err: err));
        },
        (success) {
          emit(MediaSuccessState(medias: success));
        },
      );
    } catch (e) {
      emit(MediaFailureState(err: e.toString()));
    }
  }

  void displayInitial() {
    emit(MediaInitialState());
  }
}
