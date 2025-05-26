import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../domain/repository/status_repo.dart';
import '../models/status.dart';
import '../source/status_firebase_source.dart';

class StatusRepoImpl implements StatusRepository {
  @override
  Future<Either> fetchStatus() async {
    try {
      final result = await serviceLocator<StatusRemoteSource>().fetchStatus();

      return result.fold((err) => Left(err.toString()), (allStatus) {
        final response = List.from(allStatus).map((status) {
          final String id = status['id'];
          final Map<String, dynamic> data = status['data'];
          return StatusModel.fromFirestore(data, id: id).toEntity();
        }).toList();

        return Right(response);
      });
    } catch (e) {
      return Left('$e');
    }
  }
}
