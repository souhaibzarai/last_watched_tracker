import 'package:dartz/dartz.dart';
import 'package:rekoro/features/media/domain/entities/media.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../repository/media_repo.dart';

class FetchMediasUseCase extends UsecaseStream<Either, dynamic> {
  @override
  Stream<Either<String, List<MediaEntity>>> call({params}) async* {
    yield* serviceLocator<MediaRepository>().streamAllMedia();
  }
}
