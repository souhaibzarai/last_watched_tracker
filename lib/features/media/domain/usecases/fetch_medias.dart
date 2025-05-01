import 'package:dartz/dartz.dart';
import 'package:last_watched_tracker/common/usecase.dart';
import 'package:last_watched_tracker/features/media/domain/repository/media_repo.dart';
import 'package:last_watched_tracker/service_locator.dart';

class FetchMediasUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<MediaRepository>().fetchAllMedia();
  }
}
