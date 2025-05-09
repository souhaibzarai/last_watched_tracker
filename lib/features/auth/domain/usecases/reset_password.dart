import 'package:dartz/dartz.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../../../../utils/messages/message_en.dart';
import '../repository/auth_repository.dart';

class ResetPasswordUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    if (params == null) {
      return const Left(CommonMessagesEn.invalidParameter);
    }
    return await serviceLocator<AuthRepository>().sendPasswordResetEmail(
      params,
    );
  }
}
