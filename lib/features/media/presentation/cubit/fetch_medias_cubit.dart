import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_watched_tracker/features/media/domain/usecases/fetch_medias.dart';
import 'package:last_watched_tracker/features/media/presentation/cubit/fetch_medias_state.dart';
import 'package:last_watched_tracker/service_locator.dart';

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
          print(err);
        },
        (success) => emit(
          MediaSuccessState(medias: success), //
        ),
      );
    } catch (e) {
      emit(MediaFailureState(err: e.toString()));
    }
  }

  void displayInitial() {
    emit(MediaInitialState());
  }
}
