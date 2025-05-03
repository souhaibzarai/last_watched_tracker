import 'package:dartz/dartz.dart';

import '../entities/media.dart';

abstract class MediaRepository {
  Future<Either> addNewMedia(MediaEntity media);

  Future<Either> fetchAllMedia();

  Future<Either> toggleArchive(MediaEntity media);
}
