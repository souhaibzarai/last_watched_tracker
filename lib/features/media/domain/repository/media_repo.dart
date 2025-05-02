import 'package:dartz/dartz.dart';
import 'package:last_watched_tracker/features/media/domain/entities/media.dart';

abstract class MediaRepository {
  Future<Either> addNewMedia(MediaEntity media);

  Future<Either> fetchAllMedia();

  Future<Either> toggleArchive(MediaEntity media);
}
