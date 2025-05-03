import '../../domain/entities/media.dart';

abstract class MediaState {}

class MediaInitialState extends MediaState {}

class MediaLoadingState extends MediaState {}

class MediaSuccessState extends MediaState {
  final List<MediaEntity> medias;

  MediaSuccessState({required this.medias});
}

class MediaFailureState extends MediaState {
  final String err;

  MediaFailureState({required this.err});
}
