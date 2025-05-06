import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/media/data/models/archive.dart';
import '../../../features/media/presentation/cubit/archive_media_cubit.dart';
import '../../../features/media/presentation/cubit/fetch_medias_cubit.dart';

class FunctionsHelper {
  FunctionsHelper._();

  static void toggleArchive(BuildContext context, ArchiveModel archive) async {
    final archiveCubit = context.read<ArchiveMediaCubit>();
    final fetchMediaCubit = context.read<FetchMediasCubit>();

    await archiveCubit.toggleArchive(archive);
    await fetchMediaCubit.fetchMedias(showLoading: false);
  }
}
