import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_watched_tracker/common/cubit/button/button_state.dart';

import '../../usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(InitialButtonState());

  Future<void> execute({required Usecase usecase, dynamic params}) async {
    emit(LoadingButtonState());
    try {
      final result = await usecase.call(params: params);

      result.fold(
        (errMsg) => emit(FailureButtonState(errMsg: errMsg)),
        (_) => emit(SuccessButtonState()),
      );
    } catch (e) {
      emit(FailureButtonState(errMsg: 'Error Occurred : ${e.toString()}'));
    }
  }

  void setLoading() {
    emit(LoadingButtonState());
  }

  void setFailure(String msg) {
    emit(FailureButtonState(errMsg: msg));
  }

  void setSuccess() {
    emit(SuccessButtonState());
  }

  void setIdle() {
    emit(InitialButtonState());
  }
}
