import 'package:dartz/dartz.dart';

abstract class StatusRepository {
  Future<Either> fetchStatus();
}
