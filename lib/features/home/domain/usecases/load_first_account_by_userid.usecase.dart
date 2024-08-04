import 'package:prinstom/features/home/domain/repositories/home.repository.dart';

class LoadFirstAccountByUserIdUC {
  LoadFirstAccountByUserIdUC(this.iHomeRepository);
  IHomeRepository iHomeRepository;
  FailureOrAccount call({
    required int userId,
  }) {
    return iHomeRepository.loadFirstAccountByUserId(userId);
  }
}
