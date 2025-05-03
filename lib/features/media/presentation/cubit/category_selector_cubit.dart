import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelectorCubit extends Cubit<String> {
  CategorySelectorCubit() : super('Choose Category');

  void setCategory(String name) {
    emit(name);
  }

  void setInitial() {
    emit('Choose Category');
  }
}
