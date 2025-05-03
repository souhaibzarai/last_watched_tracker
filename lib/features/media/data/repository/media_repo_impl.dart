import 'package:dartz/dartz.dart';
import 'package:last_watched_tracker/features/media/data/models/media.dart';
import 'package:last_watched_tracker/features/media/data/source/media_firebase_source.dart';
import 'package:last_watched_tracker/features/media/domain/entities/media.dart';
import 'package:last_watched_tracker/features/media/domain/repository/media_repo.dart';
import 'package:last_watched_tracker/service_locator.dart';

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

  @override
  Future<Either> fetchCategories() async {
    try {
      final result =
          await serviceLocator<MediaFirebaseSource>().fetchCategories();

      return result.fold((err) => Left(err.toString()), (categories) {
        final response =
            List.from(categories).map((category) {
              final String id = category['id'];
              final Map<String, dynamic> data = category['data'];
              return MediaModel.fromFirestore(data, id: id).toEntity();
            }).toList();

        return Right(response);
      });
    } catch (e) {
      return Left('$e');
    }
  }
}
