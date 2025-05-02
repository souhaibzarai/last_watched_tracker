abstract class ArchiveMediaState {}

class ArchiveInitialState extends ArchiveMediaState {}

class ArchiveSuccessState extends ArchiveMediaState {}

class ArchiveFailureState extends ArchiveMediaState {
  final String err;

  ArchiveFailureState({required this.err});
}
