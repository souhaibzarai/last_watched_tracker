import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../data/models/archive.dart';
import '../../domain/usecases/toggle_archive.dart';
import 'archive_media_state.dart';
import 'fetch_medias_cubit.dart';

class ArchiveMediaCubit extends Cubit<ArchiveMediaState> {
  ArchiveMediaCubit({required this.fetchMediasCubit})
    : super(ArchiveInitialState());

  final FetchMediasCubit fetchMediasCubit;

  Future<void> toggleArchive(ArchiveModel archive) async {
    try {
      final returnedData = await serviceLocator<ToggleArchiveUseCase>().call(
        params: archive,
      );

      returnedData.fold(
        (err) => emit(ArchiveFailureState(err: err)),
        (success) => emit(ArchiveSuccessState()),
      );
      fetchMediasCubit.fetchMedias(showLoading: false);
    } catch (e) {
      emit(ArchiveFailureState(err: '$e'));
    }
  }
}
