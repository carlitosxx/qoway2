import '../../../../utils/either.util.dart';
import '../../../../utils/errors/http_request.error.dart';
import '../../../auth/domain/entities/account.entity.dart';
import '../../../auth/domain/entities/transaction.entity.dart';

typedef FailureOrAccount = Future<Either<HttpRequestFailure, Account>>;
typedef FailureOrListAccounts
    = Future<Either<HttpRequestFailure, List<Account>>>;
typedef FailureOrTransaction = Future<Either<HttpRequestFailure, Transaction>>;
typedef FailureOrListTransactions
    = Future<Either<HttpRequestFailure, List<Transaction>>>;

abstract class IHomeRepository {
  FailureOrAccount loadFirstAccountByUserId(int userId);
  FailureOrAccount loadAccountByUserIdAndAccountId(int userId, int accountId);
  FailureOrAccount createAccount(String description, int userId);
  FailureOrTransaction createTransaction(
      int userId, int accountId, Transaction transaction, bool isIncome);
  FailureOrAccount editAccount(Account account, int userId);
  FailureOrListAccounts loadListAccountsByUserId(int userId);
  FailureOrListTransactions loadListIncomes(int userId, int accountId);
  FailureOrListTransactions loadListExpenses(int userId, int accountId);
}
