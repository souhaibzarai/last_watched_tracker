import '../../domain/entities/user.dart';

class UserModel {
  final String userId;
  final String username;
  final String email;

  UserModel({
    required this.userId,
    required this.email,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
    );
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(userId: userId, email: email, username: username);
  }
}
