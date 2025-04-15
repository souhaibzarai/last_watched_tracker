import 'package:dartz/dartz.dart';
import '../../../../common/usecase.dart';
import '../../../../utils/messages/message_en.dart';
import '../repository/auth_repository.dart';
import '../../../../service_locator.dart';

import '../../data/models/user_login.dart';

class SignInUseCase extends Usecase<Either, UserLogin> {
  @override
  Future<Either> call({UserLogin? params}) async {
    if (params == null) {
      return const Left(CommonMessagesEn.missingUserConnectionParams);
      
    }
    return await serviceLocator<AuthRepository>().loginUser(
      params.email!,
      params.password!,
    );
  }
}
