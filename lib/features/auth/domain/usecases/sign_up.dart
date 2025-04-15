import 'package:dartz/dartz.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../../../../utils/messages/message_en.dart';
import '../../data/models/user_creation.dart';
import '../repository/auth_repository.dart';

class SignUpUseCase implements Usecase<Either, UserCreation> {
  @override
  Future<Either> call({UserCreation? params}) async {
    if (params == null) {
      return const Left(CommonMessagesEn.missingUserCreationParams);
    }
    return await serviceLocator<AuthRepository>().registerUser(params);
  }
}
