import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../utils/messages/message_en.dart';
import '../../domain/entities/media.dart';
import '../models/archive.dart';
import '../models/media.dart';

abstract class MediaFirebaseSource {
  Future<Either> addNewMedia(MediaEntity media);

  Future<Either> fetchAllMedia();

  Future<Either> toggleArchive(ArchiveModel archive);
}

class MediaFirebaseSourceImpl implements MediaFirebaseSource {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Future<Either> addNewMedia(MediaEntity media) async {
    try {
      final mediaModel = MediaModel(
        id: '',
        title: media.title,
        category: media.category,
        status: media.status,
        imgUrl: media.imgUrl,
        progress: media.progress,
        total: media.total,
        notes: media.notes,
        createdAt: Timestamp.now(),
        updatedAt: Timestamp.now(),
      );

      final userId = _auth.currentUser?.uid;

      if (userId == null) {
        return const Left(CommonMessagesEn.notAuthenticated);
      }

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('media')
          .add(mediaModel.toFirestore());

      return const Right(CommonMessagesEn.mediaCreated);
    } catch (e) {
      return Left({CommonMessagesEn.somethingWentWrong, e.toString()});
    }
  }

  @override
  Future<Either> fetchAllMedia() async {
    try {
      final userId = _auth.currentUser?.uid;

      if (userId == null) {
        return const Left(CommonMessagesEn.notAuthenticated);
      }
      final response =
          await _firestore
              .collection('users')
              .doc(userId)
              .collection('media')
              .get();

      return Right(
        response.docs
            .map((item) => {'id': item.id, 'data': item.data()})
            .toList(),
      );
    } catch (e) {
      return Left('$e');
    }
  }

  @override
  Future<Either> toggleArchive(ArchiveModel archive) async {
    try {
      final userId = _auth.currentUser?.uid;

      if (userId == null) {
        return const Left(CommonMessagesEn.notAuthenticated);
      }
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('media')
          .doc(archive.id)
          .update({'isArchived': !archive.status});

      return Right(CommonMessagesEn.mediaArchived);
    } catch (e) {
      return Left('${CommonMessagesEn.somethingWentWrong} $e');
    }
  }
}
