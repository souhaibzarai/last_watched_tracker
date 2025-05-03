import 'package:dartz/dartz.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../../../../utils/messages/message_en.dart';
import '../entities/media.dart';
import '../repository/media_repo.dart';

class NewMediaUseCase extends Usecase<Either, MediaEntity> {
  @override
  Future<Either> call({MediaEntity? params}) async {
    if (params == null) {
      return const Left(CommonMessagesEn.missingMediaCreationParams);
    }

    return await serviceLocator<MediaRepository>().addNewMedia(params);
  }
}
