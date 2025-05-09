abstract class DeleteMediaState {}

class MediaDeleteInitial extends DeleteMediaState {}

class MediaDeleteSuccess extends DeleteMediaState {}

class MediaDeleteFailed extends DeleteMediaState {
  final String err;

  MediaDeleteFailed({required this.err});
}
