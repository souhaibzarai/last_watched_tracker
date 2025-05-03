import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_watched_tracker/features/media/domain/usecases/fetch_categories.dart';
import 'package:last_watched_tracker/service_locator.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());

    try {
      final returnedData =
          await serviceLocator<FetchCategoriesUseCase>().call();

      returnedData.fold(
        (err) => emit(CategoriesFailure(err: err.toString())),
        (data) => emit(CategoriesLoaded(categories: data)),
      );
    } catch (e) {
      emit(CategoriesFailure(err: e.toString()));
    }
  }
}
