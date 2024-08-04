import '../repositories/home.repository.dart';

class LoadListAccountsByUserIdUC {
  LoadListAccountsByUserIdUC(this.iHomeRepository);
  IHomeRepository iHomeRepository;
  FailureOrListAccounts call({required int userId}) {
    return iHomeRepository.loadListAccountsByUserId(userId);
  }
}
