import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryEntity {
  final int index;
  final String categoryId;
  final String name;
  final Timestamp createdAt;

  CategoryEntity({
    required this.index,
    required this.categoryId,
    required this.name,
    required this.createdAt,
  });
}
