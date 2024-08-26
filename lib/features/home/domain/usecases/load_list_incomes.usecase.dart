import 'package:prinstom/features/home/domain/repositories/home.repository.dart';

class LoadListIncomesUC {
  LoadListIncomesUC(this.iHomeRepository);
  IHomeRepository iHomeRepository;
  FailureOrListTransactions call({
    required int userId,
    required int accountId,
  }) {
    return iHomeRepository.loadListIncomes(userId, accountId);
  }
}
