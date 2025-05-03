import 'package:last_watched_tracker/features/category/domain/entities/category.dart';

abstract class CategoryState {}

final class CategoriesInitial extends CategoryState {}

final class CategoriesLoading extends CategoryState {}

final class CategoriesLoaded extends CategoryState {
  final List<CategoryEntity> categories;

  CategoriesLoaded({required this.categories});
}

final class CategoriesFailure extends CategoryState {
  final String err;

  CategoriesFailure({required this.err});
}
