import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/category.dart';

class CategoryModel {
  final int index;
  final String categoryId;
  final String name;
  final Timestamp createdAt;

  CategoryModel({
    required this.index,
    required this.categoryId,
    required this.name,
    required this.createdAt,
  });

  factory CategoryModel.fromFirestore(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return CategoryModel(
      categoryId: id,
      index: json['index'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      index: index,
      categoryId: categoryId,
      name: name,
      createdAt: createdAt,
    );
  }
}
