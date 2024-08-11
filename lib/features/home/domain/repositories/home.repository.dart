import '../../../../utils/either.util.dart';
import '../../../../utils/errors/http_request.error.dart';
import '../../../auth/domain/entities/account.entity.dart';

typedef FailureOrAccount = Future<Either<HttpRequestFailure, Account>>;
typedef FailureOrListAccounts
    = Future<Either<HttpRequestFailure, List<Account>>>;

abstract class IHomeRepository {
  FailureOrAccount loadFirstAccountByUserId(int userId);
  FailureOrAccount loadAccountByUserIdAndAccountId(int userId, int accountId);
  FailureOrAccount createAccount(String description, int userId);
  FailureOrAccount editAccount(Account account, int userId);
  FailureOrListAccounts loadListAccountsByUserId(int userId);
}
