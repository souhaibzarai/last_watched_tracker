import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/status.dart';

class StatusModel {
  final String id;
  final String name;
  final Timestamp createdAt;

  StatusModel({required this.id, required this.name, required this.createdAt});

  factory StatusModel.fromFirestore(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return StatusModel(
      id: id,
      name: json['name'],
      createdAt: json['createdAt'],
    );
  }
}

extension StatusXModel on StatusModel {
  StatusEntity toEntity() {
    return StatusEntity(id: id, name: name, createdAt: createdAt);
  }
}
