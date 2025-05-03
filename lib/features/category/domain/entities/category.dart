import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryEntity {
  final String id;
  final String name;
  final Timestamp createdAt;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.createdAt,
  });
}
