import 'package:prinstom/features/home/domain/repositories/home.repository.dart';

import '../../../auth/domain/entities/account.entity.dart';

class EditAccountUC {
  EditAccountUC(this.iHomeRepository);
  IHomeRepository iHomeRepository;
  FailureOrAccount call({required Account account, required int userId}) {
    return iHomeRepository.editAccount(account, userId);
  }
}
