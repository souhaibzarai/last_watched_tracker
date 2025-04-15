import 'package:get_it/get_it.dart';
import 'package:last_watched_tracker/features/auth/data/repository/auth_repo_impl.dart';
import 'package:last_watched_tracker/features/auth/data/source/firebase_auth_source.dart';
import 'package:last_watched_tracker/features/auth/domain/usecases/get_user.dart';
import 'package:last_watched_tracker/features/auth/domain/usecases/reset_password.dart';
import 'package:last_watched_tracker/features/auth/domain/usecases/sign_in.dart';
import 'package:last_watched_tracker/features/auth/domain/usecases/sign_up.dart';
import 'package:last_watched_tracker/features/auth/domain/usecases/user_status.dart';

import 'features/auth/domain/repository/auth_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // Services
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  //
  //
  //

  // Repositories
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());

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
}
