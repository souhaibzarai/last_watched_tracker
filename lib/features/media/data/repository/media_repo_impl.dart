import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../domain/entities/media.dart';
import '../../domain/repository/media_repo.dart';
import '../models/archive.dart';
import '../models/media.dart';
import '../source/media_firebase_source.dart';

class MediaRepoImpl implements MediaRepository {
  @override
  Future<Either> addNewMedia(MediaEntity media) async {
    return await serviceLocator<MediaFirebaseSource>().addNewMedia(media);
  }

  @override
  Stream<Either<String, List<MediaEntity>>> streamAllMedia() async* {
    try {
      final result = serviceLocator<MediaFirebaseSource>().streamAllMedia();

      yield* result.asyncMap(
        //
        (either) async {
          return either.fold(
            (err) => Left<String, List<MediaEntity>>(err),
            (mediaList) {
              final List<MediaEntity> response = mediaList.map<MediaEntity>((
                media,
              ) {
                final String id = media['id'];
                final Map<String, dynamic> data = media['data'];
                return MediaModel.fromFirestore(data, id: id).toEntity();
              }).toList();

              return Right<String, List<MediaEntity>>(response);
            },
          );
        },
      );
    } catch (e) {
      yield Left<String, List<MediaEntity>>(e.toString());
    }
  }

  @override
  Future<Either> toggleArchive(ArchiveModel archive) async {
    return await serviceLocator<MediaFirebaseSource>().toggleArchive(archive);
  }

  @override
  Future<Either> deleteMedia(String id) async {
    return await serviceLocator<MediaFirebaseSource>().deleteMedia(id);
  }
}
