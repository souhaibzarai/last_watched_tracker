import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/data/repository/auth_repo_impl.dart';
import 'features/auth/data/source/firebase_auth_source.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/get_user.dart';
import 'features/auth/domain/usecases/reset_password.dart';
import 'features/auth/domain/usecases/sign_in.dart';
import 'features/auth/domain/usecases/sign_up.dart';
import 'features/auth/domain/usecases/user_status.dart';
import 'features/category/data/repository/category_repo_impl.dart';
import 'features/category/data/source/category_firebase_source.dart';
import 'features/category/domain/repository/category_repo.dart';
import 'features/category/domain/usecases/fetch_categories.dart';
import 'features/media/data/repository/media_repo_impl.dart';
import 'features/media/data/source/media_firebase_source.dart';
import 'features/media/domain/repository/media_repo.dart';
import 'features/media/domain/usecases/fetch_medias.dart';
import 'features/media/domain/usecases/new_media.dart';
import 'features/media/domain/usecases/toggle_archive.dart';
import 'features/status/data/repository/status_repo_impl.dart';
import 'features/status/data/source/status_firebase_source.dart';
import 'features/status/domain/repository/status_repo.dart';
import 'features/status/domain/usecases/fetch_status.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  // Services
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(auth: serviceLocator<FirebaseAuth>()),
  );

  serviceLocator.registerSingleton<MediaFirebaseSource>(
    MediaFirebaseSourceImpl(),
  );

  serviceLocator.registerSingleton<CategoryRemoteSource>(
    CategoryRemoteSourceImpl(),
  );

  serviceLocator.registerSingleton<StatusRemoteSource>(
    StatusRemoteSourceImpl(),
  );

  //
  //
  //

  // Repositories
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  serviceLocator.registerSingleton<MediaRepository>(MediaRepoImpl());

  serviceLocator.registerSingleton<CategoryRepository>(
    CategoryRepoImpl(), //
  );

  serviceLocator.registerSingleton<StatusRepository>(
    StatusRepoImpl(), //
  );

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

  serviceLocator.registerSingleton<ToggleArchiveUseCase>(
    ToggleArchiveUseCase(),
  );

  // Category
  serviceLocator.registerSingleton<FetchCategoriesUseCase>(
    FetchCategoriesUseCase(),
  );

  // Status
  serviceLocator.registerSingleton<FetchStatusUseCase>(FetchStatusUseCase());
}
