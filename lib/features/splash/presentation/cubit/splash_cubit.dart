import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../service_locator.dart';
import '../../../auth/domain/usecases/user_status.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    final bool isLoggedIn = await serviceLocator<UserStatusUseCase>().call();
    await Future.delayed(Duration(seconds: 1)); //TODO remove this
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
