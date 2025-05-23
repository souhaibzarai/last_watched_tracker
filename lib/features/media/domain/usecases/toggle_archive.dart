import 'package:dartz/dartz.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../../../../utils/messages/message_en.dart';
import '../../data/models/archive.dart';
import '../repository/media_repo.dart';

class ToggleArchiveUseCase extends Usecase<Either, ArchiveModel> {
  @override
  Future<Either> call({ArchiveModel? params}) async {
    if (params == null) {
      return const Left(CommonMessagesEn.errorOnArchive);
    }

    return await serviceLocator<MediaRepository>().toggleArchive(params);
  }
}
