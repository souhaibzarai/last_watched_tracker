import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRemoteSource {
  Future<Either> fetchCategories();
}

class CategoryRemoteSourceImpl implements CategoryRemoteSource {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<Either> fetchCategories() async {
    try {
      final response = await _firestore.collection('categories').get();

      return Right(
        response.docs
            .map((item) => {'id': item.id, 'data': item.data()})
            .toList(),
      );
    } catch (e) {
      return Left('$e');
    }
  }
}
