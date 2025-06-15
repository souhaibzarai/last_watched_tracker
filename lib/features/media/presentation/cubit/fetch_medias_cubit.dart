import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../domain/usecases/fetch_medias.dart';
import 'fetch_medias_state.dart';

class FetchMediasCubit extends Cubit<MediaState> {
  FetchMediasCubit() : super(MediaInitialState());

  StreamSubscription? _mediaSubscription;

  void fetchMedias() async {
    emit(MediaLoadingState());

    _mediaSubscription?.cancel();

    try {
      _mediaSubscription = serviceLocator<FetchMediasUseCase>().call().listen(
        (either) {
          either.fold(
            (err) => emit(MediaFailureState(err: err)),
            (success) => emit(MediaSuccessState(medias: success)),
          );
        },
        onError: (e) {
          print('on error ' + e.toString());
          emit(MediaFailureState(err: e.toString()));
        },
      );
    } catch (e) {
      print('on catch' + e.toString());

      emit(MediaFailureState(err: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _mediaSubscription?.cancel();
    return super.close();
  }

  void displayInitial() {
    emit(MediaInitialState());
  }
}
