import 'package:prinstom/features/home/domain/repositories/home.repository.dart';

class CreateAccountUC {
  CreateAccountUC(this.homeRepository);
  IHomeRepository homeRepository;
  FailureOrAccount call({required String description, required int userId}) {
    return homeRepository.createAccount(description, userId);
  }
}
