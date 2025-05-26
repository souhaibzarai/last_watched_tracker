import 'package:dartz/dartz.dart';

import '../../data/models/user_creation.dart';

abstract class AuthRepository {
  Future<Either> registerUser(UserCreation user);

  Future<Either> loginUser(String email, String password);

  Future<Either> sendPasswordResetEmail(String email);

  Future<bool> isLoggedIn();

  Future<Either> getUser();

  Future<void> signOut();
}
