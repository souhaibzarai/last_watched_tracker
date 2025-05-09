import 'package:dartz/dartz.dart';

import '../../data/models/archive.dart';
import '../entities/media.dart';

abstract class MediaRepository {
  Future<Either> addNewMedia(MediaEntity media);

  Future<Either> fetchAllMedia();

  Future<Either> toggleArchive(ArchiveModel archive);

  Future<Either> deleteMedia(String id);
}
