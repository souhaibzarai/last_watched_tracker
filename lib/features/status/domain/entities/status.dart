import 'package:cloud_firestore/cloud_firestore.dart';

class StatusEntity {
  final String id;
  final String name;
  final Timestamp createdAt;

  StatusEntity({required this.id, required this.name, required this.createdAt});
}
