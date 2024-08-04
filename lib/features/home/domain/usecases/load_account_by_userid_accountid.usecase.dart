import '../repositories/home.repository.dart';

class LoadAccountByUserIdAndAccountIdUC {
  LoadAccountByUserIdAndAccountIdUC(this.iHomeRepository);
  IHomeRepository iHomeRepository;
  FailureOrAccount call({required int userId, required accountId}) {
    return iHomeRepository.loadAccountByUserIdAndAccountId(userId, accountId);
  }
}
