import '../entities/media.dart';

class MediaMappers {
  static getMedias(
    List<MediaEntity> importedMedias, {
    bool isArchived = false,
  }) {
    return List<MediaEntity>.from(
      importedMedias.where((media) => media.isArchived == isArchived),
    ).toList();
  }
}
