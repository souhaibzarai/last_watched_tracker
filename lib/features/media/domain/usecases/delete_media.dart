import 'package:dartz/dartz.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../../../../utils/messages/message_en.dart';
import '../repository/media_repo.dart';

class DeleteMediaUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    if (params == null) {
      return Left(CommonMessagesEn.invalidParameter);
    }

    return await serviceLocator<MediaRepository>().deleteMedia(params);
  }
}
