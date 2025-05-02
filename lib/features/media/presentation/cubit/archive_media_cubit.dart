import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../domain/entities/media.dart';
import '../../domain/usecases/toggle_archive.dart';
import 'archive_media_state.dart';
import 'fetch_medias_cubit.dart';

class ArchiveMediaCubit extends Cubit<ArchiveMediaState> {
  ArchiveMediaCubit({required this.fetchMediasCubit})
    : super(ArchiveInitialState());

  final FetchMediasCubit fetchMediasCubit;

  Future<void> toggleArchive(MediaEntity media) async {
    try {
      final returnedData = await serviceLocator<ToggleArchiveUseCase>().call(
        params: media,
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
