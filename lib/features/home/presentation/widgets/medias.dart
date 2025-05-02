import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/app_commons.dart';
import '../../../media/presentation/cubit/fetch_medias_state.dart';
import '../../../media/presentation/cubit/fetch_medias_cubit.dart';
import '../../../media/presentation/widgets/media_item.dart';
import '../../../../utils/messages/message_en.dart';

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
          if (medias.isEmpty) {
            return const SizedBox(
              height: 100,
              child: Center(child: Text(CommonMessagesEn.mediaListEmpty)),
            );
          }
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
