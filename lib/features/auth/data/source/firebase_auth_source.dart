import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../utils/messages/message_en.dart';
import '../models/user_creation.dart';

abstract class AuthFirebaseService {
  Future<Either> registerUser(UserCreation user);

  Future<Either> loginUser(String email, String password);

  Future<Either> sendPasswordResetEmail(String email);

  Future<bool> isLoggedIn();

  Future<Either> getUser();

  Future<void> signOut();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  final FirebaseAuth _auth;

  AuthFirebaseServiceImpl({required FirebaseAuth auth}) : _auth = auth;

  @override
  Future<Either> registerUser(UserCreation user) async {
    late String? userId;
    try {
      final returnedData = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (returnedData.user != null) {
        userId = returnedData.user!.uid;
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(returnedData.user!.uid)
          .set({
            'userId': userId,
            'username': user.username,
            'email': user.email,
          });

      return const Right(CommonMessagesEn.accountCreated);
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = CommonMessagesEn.passwordTooWeak;
      } else if (e.code == 'email-already-in-use') {
        message = CommonMessagesEn.emailAlreadyUsed;
      }
      return Left(message);
    }
  }

  @override
  Future<Either> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email' || e.code == 'invalid-credential') {
        message = CommonMessagesEn.invalidCredentials;
      }

      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      return const Right(CommonMessagesEn.passwordResetLinkSent);
    } catch (e) {
      return const Left(CommonMessagesEn.operationFailed);
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      final currentUser = _auth.currentUser;
      late String userId;

      if (currentUser == null) {
        return const Left(CommonMessagesEn.notAuthenticated);
      }

      userId = currentUser.uid;
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((value) => value.data());
      if (userData == null) {
        return const Left(CommonMessagesEn.notAuthenticated);
      }
      return Right(userData);
      //
    } catch (e) {
      //
      return Left('${CommonMessagesEn.somethingWentWrong} $e');
    }
  }

  @override
  Future<void> signOut() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      return;
    }

    return await _auth.signOut();
  }
}
