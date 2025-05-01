import 'package:get_it/get_it.dart';
import 'features/auth/data/repository/auth_repo_impl.dart';
import 'features/auth/data/source/firebase_auth_source.dart';
import 'features/auth/domain/usecases/get_user.dart';
import 'features/auth/domain/usecases/reset_password.dart';
import 'features/auth/domain/usecases/sign_in.dart';
import 'features/auth/domain/usecases/sign_up.dart';
import 'features/auth/domain/usecases/user_status.dart';
import 'features/media/data/source/media_firebase_source.dart';
import 'features/media/domain/repository/media_repo.dart';
import 'features/media/domain/usecases/fetch_medias.dart';
import 'features/media/domain/usecases/new_media.dart';

import 'features/auth/domain/repository/auth_repository.dart';
import 'features/media/data/repository/media_repo_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // Services
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  serviceLocator.registerSingleton<MediaFirebaseSource>(
    MediaFirebaseSourceImpl(),
  );

  //
  //
  //

  // Repositories
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  serviceLocator.registerSingleton<MediaRepository>(MediaRepoImpl());

  //
  //
  //

  // UseCases

  serviceLocator.registerSingleton<GetUserUseCase>(GetUserUseCase());

  serviceLocator.registerSingleton<ResetPasswordUseCase>(
    ResetPasswordUseCase(),
  );

  serviceLocator.registerSingleton<SignInUseCase>(SignInUseCase());

  serviceLocator.registerSingleton<SignUpUseCase>(SignUpUseCase());

  serviceLocator.registerSingleton<UserStatusUseCase>(UserStatusUseCase());

  //Media
  serviceLocator.registerSingleton<NewMediaUseCase>(NewMediaUseCase());

  serviceLocator.registerSingleton<FetchMediasUseCase>(FetchMediasUseCase());
}
