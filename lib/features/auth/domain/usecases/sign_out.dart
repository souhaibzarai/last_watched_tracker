import '../../../../common/usecase.dart';
import '../repository/auth_repository.dart';
import '../../../../service_locator.dart';

class SignOutUseCase extends Usecase<void, dynamic> {
  @override
  Future<void> call({params}) async {
    return await serviceLocator<AuthRepository>().signOut();
  }
}
