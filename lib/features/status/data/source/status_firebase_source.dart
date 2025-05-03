import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class StatusRemoteSource {
  Future<Either> fetchStatus();
}

class StatusRemoteSourceImpl implements StatusRemoteSource {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<Either> fetchStatus() async {
    try {
      final response = await _firestore.collection('status').get();

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
