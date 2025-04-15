import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../domain/repository/auth_repository.dart';
import '../models/user.dart';
import '../models/user_creation.dart';
import '../source/firebase_auth_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> registerUser(UserCreation user) async {
    return await serviceLocator<AuthFirebaseService>().registerUser(user);
  }

  @override
  Future<Either> loginUser(String email, String password) async {
    return await serviceLocator<AuthFirebaseService>().loginUser(
      email,
      password,
    );
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await serviceLocator<AuthFirebaseService>().sendPasswordResetEmail(
      email,
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    return await serviceLocator<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    final user = await serviceLocator<AuthFirebaseService>().getUser();

    return user.fold(
      (error) => Left(error.toString()), //
      (data) => Right(UserModel.fromJson(data).toEntity()),
    );
  }

  @override
  Future<void> signOut() async {
    return await serviceLocator<AuthFirebaseService>().signOut();
  }
}
