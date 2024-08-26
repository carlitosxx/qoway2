import 'package:prinstom/features/home/domain/repositories/home.repository.dart';

class LoadListExpensesUC {
  LoadListExpensesUC(this.iHomeRepository);
  IHomeRepository iHomeRepository;
  FailureOrListTransactions call({
    required int userId,
    required int accountId,
  }) {
    return iHomeRepository.loadListExpenses(userId, accountId);
  }
}
