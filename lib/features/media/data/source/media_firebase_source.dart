import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:last_watched_tracker/features/media/data/models/media.dart';
import 'package:last_watched_tracker/utils/messages/message_en.dart';

import '../../domain/entities/media.dart';

abstract class MediaFirebaseSource {
  Future<Either> addNewMedia(MediaEntity media);

  Future<Either> fetchAllMedia();
}

class MediaFirebaseSourceImpl implements MediaFirebaseSource {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _media = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('media');

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
        return const Left(CommonMessagesEn.userIsNotAuthenticated);
      }

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('media')
          .add(mediaModel.toFirestore());

      return const Right(CommonMessagesEn.mediaCreatedSuccessfully);
    } catch (e) {
      return Left({CommonMessagesEn.errorOccurred, e.toString()});
    }
  }

  @override
  Future<Either> fetchAllMedia() async {
    try {
      final userId = _auth.currentUser?.uid;

      if (userId == null) {
        return const Left(CommonMessagesEn.userIsNotAuthenticated);
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
}
