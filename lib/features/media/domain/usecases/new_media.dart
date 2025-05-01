import 'package:dartz/dartz.dart';
import 'package:last_watched_tracker/common/usecase.dart';
import 'package:last_watched_tracker/features/media/domain/entities/media.dart';
import 'package:last_watched_tracker/features/media/domain/repository/media_repo.dart';
import 'package:last_watched_tracker/service_locator.dart';
import 'package:last_watched_tracker/utils/messages/message_en.dart';

class NewMediaUseCase extends Usecase<Either, MediaEntity> {
  @override
  Future<Either> call({MediaEntity? params}) async {
    if (params == null) {
      return const Left(CommonMessagesEn.missingMediaCreationParams);
    }

    return await serviceLocator<MediaRepository>().addNewMedia(params);
  }
}
