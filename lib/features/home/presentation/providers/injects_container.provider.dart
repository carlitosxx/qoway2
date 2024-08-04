import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/map_failure_to_string.util.dart';
import '../../data/datasources/db_isar.datasource.dart';
import '../../data/repositories_impl/home.repository_impl.dart';
import '../../domain/repositories/home.repository.dart';
import '../../domain/usecases/load_account_by_userid_accountid.usecase.dart';
import '../../domain/usecases/load_first_account_by_userid.usecase.dart';
import '../../domain/usecases/load_list_accounts_by_userid.usecase.dart';
import 'load_account_by_userid_accountid/load_account_by_userid_accountid.state.dart';
import 'load_first_account_by_userid/load_first_account_by_userid.state.dart';
import 'load_list_accounts_by_userid/load_list_accounts_by_userid.state.dart';
part 'load_first_account_by_userid/load_first_account_by_userid.notifier.dart';
part 'load_account_by_userid_accountid/load_account_by_userid_accountid.notifier.dart';
part 'load_list_accounts_by_userid/load_list_accounts_by_userid.notifier.dart';

// * Repositories Inject
/// Repositorio de autenticacion
final homeRepositoryProvider = Provider<IHomeRepository>(
  (ref) => HomeRepositoryImpl(
    dataBaseIsarDataSourceImpl: DataBaseIsarDataSourceImpl(),
  ),
);
// * Usecases Inject
final _loadAccountByUserIdAndAccountIdUC =
    Provider<LoadAccountByUserIdAndAccountIdUC>(
  (ref) {
    final repository = ref.watch(homeRepositoryProvider);
    return LoadAccountByUserIdAndAccountIdUC(repository);
  },
);

final _loadFirstAccountByUserIdUC = Provider<LoadFirstAccountByUserIdUC>(
  (ref) {
    final repository = ref.watch(homeRepositoryProvider);
    return LoadFirstAccountByUserIdUC(repository);
  },
);
final _loadListAccountsByUserIdUC = Provider<LoadListAccountsByUserIdUC>(
  (ref) {
    final repository = ref.watch(homeRepositoryProvider);
    return LoadListAccountsByUserIdUC(repository);
  },
);

// * State Notifier Providers
final loadAccountByUserIdAndAccountIdNotifierProvider = StateNotifierProvider<
    LoadAccountByUserIdAndAccountIdNotifier,
    LoadAccountByUserIdAndAccountIdState>(
  (ref) => LoadAccountByUserIdAndAccountIdNotifier(
    loadAccountByUserIdAndAccountIdUC:
        ref.watch(_loadAccountByUserIdAndAccountIdUC),
  ),
);
final loadFirstAccountByUserIdNotifierProvider = StateNotifierProvider<
    LoadFirstAccountByUserIdNotifier, LoadFirstAccountByUserIdState>(
  (ref) => LoadFirstAccountByUserIdNotifier(
    loadFirstAccountByUserIdUC: ref.watch(_loadFirstAccountByUserIdUC),
  ),
);
final loadListAccountsByUserIdNotifierProvider = StateNotifierProvider<
    LoadListAccountsByUserIdNotifier, LoadListAccountsByUserIdState>(
  (ref) => LoadListAccountsByUserIdNotifier(
    loadListAccountsByUserIdUC: ref.watch(_loadListAccountsByUserIdUC),
  ),
);
