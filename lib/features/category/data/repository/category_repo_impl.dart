import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../domain/repository/category_repo.dart';
import '../models/category.dart';
import '../source/category_firebase_source.dart';

class CategoryRepoImpl implements CategoryRepository {
  @override
  Future<Either> fetchCategories() async {
    try {
      final result = await serviceLocator<CategoryRemoteSource>()
          .fetchCategories();

      return result.fold((err) => Left(err.toString()), (categories) {
        final response = List.from(categories).map((category) {
          final String id = category['id'];
          final Map<String, dynamic> data = category['data'];
          return CategoryModel.fromFirestore(data, id: id).toEntity();
        }).toList();

        return Right(response);
      });
    } catch (e) {
      return Left('$e');
    }
  }
}
