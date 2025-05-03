import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/category.dart';

class CategoryModel {
  final String id;
  final String name;
  final Timestamp createdAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory CategoryModel.fromFirestore(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return CategoryModel(
      id: id,
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      createdAt: createdAt,
    );
  }
}
