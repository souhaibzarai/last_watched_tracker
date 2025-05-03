import '../../../auth/domain/entities/user.dart';

abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoadSuccess extends UserInfoState {
  final UserEntity userEntity;

  UserInfoLoadSuccess({required this.userEntity});
}

class UserInfoLoadFailed extends UserInfoState {
  final String errMsg;

  UserInfoLoadFailed({required this.errMsg});
}
