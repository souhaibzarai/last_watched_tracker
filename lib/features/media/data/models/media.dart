import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/media.dart';

class MediaModel {
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

  MediaModel({
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

  factory MediaModel.fromFirestore(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return MediaModel(
      id: id,
      title: json['title'] ?? 'Unknown',
      category: json['category'],
      status: json['status'],
      imgUrl: json['imgUrl'] ?? '',
      progress: json['progress'],
      total: json['total'] != null ? json['total'] as String : null,
      notes: json['notes'] != null ? json['notes'] as String : null,
      isArchived: json['isArchived'] ?? false,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title.trim(),
      'category': category.trim(),
      'status': status,
      'imgUrl': imgUrl,
      'progress': progress,
      'total': total,
      'notes': notes,
      'isArchived': isArchived,
      'createdAt': createdAt ?? Timestamp.now(),
      'updatedAt': updatedAt,
    };
  }
}

extension MediaXModel on MediaModel {
  MediaEntity toEntity() {
    return MediaEntity(
      id: id,
      title: title,
      category: category,
      status: status,
      imgUrl: imgUrl,
      progress: progress,
      total: total,
      notes: notes,
      isArchived: isArchived,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
