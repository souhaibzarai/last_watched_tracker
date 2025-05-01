import 'package:cloud_firestore/cloud_firestore.dart';

class MediaEntity {
  String id;
  String title;
  String category;
  String status;
  String progress;
  String? total;
  String imgUrl;
  String? notes;
  bool isArchived;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  MediaEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.status,
    required this.imgUrl,
    required this.progress,
    this.total,
    this.notes,
    this.isArchived = false,
    this.createdAt,
    this.updatedAt,
  });
}
