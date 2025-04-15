import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../repository/auth_repository.dart';

class UserStatusUseCase extends Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await serviceLocator<AuthRepository>().isLoggedIn();
  }
}
