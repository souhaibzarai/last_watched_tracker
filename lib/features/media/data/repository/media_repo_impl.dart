import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../domain/entities/media.dart';
import '../../domain/repository/media_repo.dart';
import '../models/media.dart';
import '../source/media_firebase_source.dart';

class MediaRepoImpl implements MediaRepository {
  @override
  Future<Either> addNewMedia(MediaEntity media) async {
    return await serviceLocator<MediaFirebaseSource>().addNewMedia(media);
  }

  @override
  Future<Either> fetchAllMedia() async {
    try {
      final result =
          await serviceLocator<MediaFirebaseSource>().fetchAllMedia();

      return result.fold((err) => Left(err.toString()), (mediaList) {
        final response =
            List.from(mediaList).map((media) {
              final String id = media['id'];
              final Map<String, dynamic> data = media['data'];
              return MediaModel.fromFirestore(data, id: id).toEntity();
            }).toList();

        return Right(response);
      });
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<Either> toggleArchive(MediaEntity media) async {
    return await serviceLocator<MediaFirebaseSource>().toggleArchive(media);
  }
}
