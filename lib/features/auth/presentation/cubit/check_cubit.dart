import 'package:flutter_bloc/flutter_bloc.dart';

class CheckCubit extends Cubit<bool> {
  CheckCubit() : super(false);

  void setObscureStatus() {
    emit(!state);
  }

  void changeValue(bool newValue) {
    emit(newValue);
  }
}
