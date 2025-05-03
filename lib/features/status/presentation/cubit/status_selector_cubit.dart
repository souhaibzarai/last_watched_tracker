import 'package:flutter_bloc/flutter_bloc.dart';

class StatusSelectorCubit extends Cubit<String> {
  StatusSelectorCubit() : super('Choose Status');

  void setStatus(String name) {
    emit(name);
  }

  void setInitial() {
    emit('Choose Status');
  }
}
