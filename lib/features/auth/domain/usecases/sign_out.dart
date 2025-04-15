import 'package:last_watched_tracker/common/usecase.dart';
import 'package:last_watched_tracker/features/auth/domain/repository/auth_repository.dart';
import 'package:last_watched_tracker/service_locator.dart';

class SignOutUseCase extends Usecase<void, dynamic> {
  @override
  Future<void> call({params}) async {
    return await serviceLocator<AuthRepository>().signOut();
  }
}
