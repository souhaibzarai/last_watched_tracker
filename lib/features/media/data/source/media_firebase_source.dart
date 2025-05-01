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
  final _user = FirebaseAuth.instance.currentUser;

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

      await _firestore
          .collection('users')
          .doc(_user!.uid)
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
      final response =
          await _firestore
              .collection('users')
              .doc(_user!.uid)
              .collection('media')
              .get();

      return Right(
        response.docs
            .map(
              (item) => {
                'id': item.id,
                'data': item.data(),
              },
            )
            .toList(),
      );
    } catch (e) {
      return Left('$e');
    }
  }
}
