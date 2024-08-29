import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/map_failure_to_string.util.dart';
import '../../../auth/domain/entities/account.entity.dart';
import '../../../auth/domain/entities/transaction.entity.dart';
import '../../data/datasources/db_isar.datasource.dart';
import '../../data/repositories_impl/home.repository_impl.dart';
import '../../domain/repositories/home.repository.dart';
import '../../domain/usecases/create_account.usecase.dart';
import '../../domain/usecases/create_transaction.usecase.dart';
import '../../domain/usecases/edit_account.usecase.dart';
import '../../domain/usecases/load_account_by_userid_accountid.usecase.dart';
import '../../domain/usecases/load_first_account_by_userid.usecase.dart';
import '../../domain/usecases/load_list_accounts_by_userid.usecase.dart';
import '../../domain/usecases/load_list_expenses.usecase.dart';
import '../../domain/usecases/load_list_incomes.usecase.dart';
import 'create_account/create_account.state.dart';
import 'create_transaction/create_transaction.state.dart';
import 'edit_account/edit_account.state.dart';
import 'load_account_by_userid_accountid/account_selected.provider.dart';
import 'load_account_by_userid_accountid/load_account_by_userid_accountid.state.dart';
import 'load_first_account_by_userid/load_first_account_by_userid.state.dart';
import 'load_list_accounts_by_userid/load_list_accounts_by_userid.state.dart';
import 'load_list_expenses/load_list_expenses.state.dart';
import 'load_list_incomes/load_list_incomes.state.dart';
part 'load_first_account_by_userid/load_first_account_by_userid.notifier.dart';
part 'load_account_by_userid_accountid/load_account_by_userid_accountid.notifier.dart';
part 'load_list_accounts_by_userid/load_list_accounts_by_userid.notifier.dart';
part 'create_account/create_account.notifier.dart';
part 'edit_account/edit_account.notifier.dart';
part 'create_transaction/create_transaction.notifier.dart';
part 'load_list_expenses/load_list_expenses.notifier.dart';
part 'load_list_incomes/load_list_incomes.notifier.dart';

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
final _createAccountUC = Provider<CreateAccountUC>(
  (ref) {
    final repository = ref.watch(homeRepositoryProvider);
    return CreateAccountUC(repository);
  },
);
final _editAccountUC = Provider<EditAccountUC>(
  (ref) {
    final repository = ref.watch(homeRepositoryProvider);
    return EditAccountUC(repository);
  },
);
final _createTransactionUC = Provider<CreateTransactionUC>(
  (ref) {
    final repository = ref.watch(homeRepositoryProvider);
    return CreateTransactionUC(repository);
  },
);

final _loadListIncomesUC = Provider<LoadListIncomesUC>(
  (ref) {
    final repository = ref.watch(homeRepositoryProvider);
    return LoadListIncomesUC(repository);
  },
);
final _loadListExpensesUC = Provider<LoadListExpensesUC>(
  (ref) {
    final repository = ref.watch(homeRepositoryProvider);
    return LoadListExpensesUC(repository);
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
final createAccountNotifierProvider =
    StateNotifierProvider<CreateAccountNotifier, CreateAccountState>(
  (ref) => CreateAccountNotifier(
    createAccountUC: ref.watch(_createAccountUC),
  ),
);
final createTransactionNotifierProvider =
    StateNotifierProvider<CreateTransactionNotifier, CreateTransactionState>(
  (ref) => CreateTransactionNotifier(
    createTransactionUC: ref.watch(_createTransactionUC),
  ),
);
final editAccountNotifierProvider =
    StateNotifierProvider<EditAccountNotifier, EditAccountState>(
  (ref) => EditAccountNotifier(
    editAccountUC: ref.watch(_editAccountUC),
  ),
);
final loadListIncomesNotifierProvider =
    StateNotifierProvider<LoadListIncomesNotifier, LoadListIncomesState>(
  (ref) => LoadListIncomesNotifier(
    loadListIncomesUC: ref.watch(_loadListIncomesUC),
  ),
);
final loadListExpensesNotifierProvider =
    StateNotifierProvider<LoadListExpensesNotifier, LoadListExpensesState>(
  (ref) => LoadListExpensesNotifier(
    loadListExpensesUC: ref.watch(_loadListExpensesUC),
  ),
);
