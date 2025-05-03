import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/domain/usecases/get_user.dart';
import 'user_info_state.dart';
import '../../../../service_locator.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitial());

  Future<void> getUserInfo({bool showLoading = true}) async {
    if (showLoading) {
      emit(UserInfoLoading());
    }
    try {
      final result = await serviceLocator<GetUserUseCase>().call();

       result.fold(
        (err) => emit(UserInfoLoadFailed(errMsg: err.toString())),
        (user) => emit(UserInfoLoadSuccess(userEntity: user)), //
      );
    } catch (e) {
      emit(UserInfoLoadFailed(errMsg: e.toString()));
    }
  }
}
