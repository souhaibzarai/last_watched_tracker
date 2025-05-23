import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_commons.dart';
import '../../../../utils/messages/message_en.dart';
import '../../../media/domain/mappers/media.dart';
import '../../../media/presentation/cubit/fetch_medias_cubit.dart';
import '../../../media/presentation/cubit/fetch_medias_state.dart';
import '../../../media/presentation/widgets/media_item.dart';

class Medias extends StatelessWidget {
  const Medias({super.key, this.isArchived = false, this.scrollPhysics});

  final bool isArchived;
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchMediasCubit, MediaState>(
      builder: (context, state) {
        if (state is MediaLoadingState) {
          return SizedBox(
            height: 100,
            child: Center(child: AppCommons.centerProgressIndicator),
          );
        } else if (state is MediaSuccessState) {
          final medias = MediaMappers.getMedias(
            state.medias,
            isArchived: isArchived,
          );
          if (medias.isEmpty) {
            return SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  isArchived
                      ? CommonMessagesEn.archivedListEmpty
                      : CommonMessagesEn.mediaListEmpty,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: scrollPhysics,
            itemCount: medias.length,
            itemBuilder: (context, index) {
              return MediaItem(media: medias[index]);
            },
          );
        } else if (state is MediaFailureState) {
          AppCommons.showScaffold(context, message: state.err);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
