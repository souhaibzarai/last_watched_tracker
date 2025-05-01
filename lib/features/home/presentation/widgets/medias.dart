import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_watched_tracker/common/app_commons.dart';
import 'package:last_watched_tracker/features/media/presentation/cubit/fetch_medias_state.dart';
import 'package:last_watched_tracker/features/media/presentation/cubit/fetch_medias_cubit.dart';
import 'package:last_watched_tracker/features/media/presentation/widgets/media_item.dart';

class Medias extends StatelessWidget {
  const Medias({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchMediasCubit, MediaState>(
      builder: (context, state) {
        if (state is MediaLoadingState) {
          AppCommons.centerProgressIndicator;
        } else if (state is MediaSuccessState) {
          final medias = state.medias;
          return Expanded(
            child: ListView.builder(
              itemCount: medias.length,
              itemBuilder: (context, index) {
                return MediaItem(mediaEntity: medias[index]);
              },
            ),
          );
        } else if (state is MediaFailureState) {
          AppCommons.showScaffold(context, message: state.err);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
