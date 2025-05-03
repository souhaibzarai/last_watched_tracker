import 'package:dartz/dartz.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../repository/media_repo.dart';

class FetchMediasUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<MediaRepository>().fetchAllMedia();
  }
}
