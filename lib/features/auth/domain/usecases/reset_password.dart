import 'package:dartz/dartz.dart';
import '../../../../utils/messages/message_en.dart';
import '../../../../common/usecase.dart';
import '../repository/auth_repository.dart';
import '../../../../service_locator.dart';

class ResetPasswordUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    if (params == null) {
      return const Left(CommonMessagesEn.invalidParam);
    }
    return await serviceLocator<AuthRepository>().sendPasswordResetEmail(
      params,
    );
  }
}
