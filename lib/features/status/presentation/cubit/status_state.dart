import '../../domain/entities/status.dart';

abstract class StatusState {}

final class StatusInitial extends StatusState {}

final class StatusLoading extends StatusState {}

final class StatusLoaded extends StatusState {
  final List<StatusEntity> status;

  StatusLoaded({required this.status});
}

final class StatusFailure extends StatusState {
  final String err;

  StatusFailure({required this.err});
}
