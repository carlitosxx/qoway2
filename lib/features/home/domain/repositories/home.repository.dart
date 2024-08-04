import '../../../../utils/either.util.dart';
import '../../../../utils/errors/http_request.error.dart';
import '../../../auth/domain/entities/account.entity.dart';

typedef FailureOrAccount = Future<Either<HttpRequestFailure, Account>>;
typedef FailureOrListAccounts
    = Future<Either<HttpRequestFailure, List<Account>>>;

abstract class IHomeRepository {
  FailureOrAccount loadFirstAccountByUserId(int userId);
  FailureOrAccount loadAccountByUserIdAndAccountId(int userId, int accountId);
  FailureOrListAccounts loadListAccountsByUserId(int userId);
}
