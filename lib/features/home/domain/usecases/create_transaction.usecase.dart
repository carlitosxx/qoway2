import '../../../auth/domain/entities/transaction.entity.dart';
import '../repositories/home.repository.dart';

class CreateTransactionUC {
  CreateTransactionUC(this.iHomeRepository);
  IHomeRepository iHomeRepository;
  FailureOrTransaction call(
      {required int userId,
      required int accountId,
      required Transaction transaction,
      required bool isIncome}) {
    return iHomeRepository.createTransaction(
      userId,
      accountId,
      transaction,
      isIncome,
    );
  }
}
