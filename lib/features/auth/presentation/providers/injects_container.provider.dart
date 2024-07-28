import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/map_failure_to_string.util.dart';
import '../../data/datasources/local/db_isar.datasource.dart';
import '../../data/repositories_impl/auth.repository_impl.dart';
import '../../domain/repositories/auth.repository.dart';
import '../../domain/usecases/signin_email_password.usecase.dart';
import 'signin_email_password/signin_email_password.state.dart';
part 'signin_email_password/signin_email_password.notifier.dart';

// * Repositories Inject
/// Repositorio de autenticacion
final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRepositoryImpl(
    dataBaseIsarDataSourceImpl: DataBaseIsarDataSourceImpl(),
  ),
);
// * Usecases Inject
final _signinEmailPasswordUC = Provider<SigninEmailPasswordUC>(
  (ref) {
    final repository = ref.watch(authRepositoryProvider);
    return SigninEmailPasswordUC(repository);
  },
);
// * State Notifier Providers
final signinEmailPasswordNotifierProvider = StateNotifierProvider<
    SigninEmailPasswordNotifier, SigninEmailPasswordState>(
  (ref) => SigninEmailPasswordNotifier(
    signinEmailPasswordUC: ref.watch(_signinEmailPasswordUC),
  ),
);
