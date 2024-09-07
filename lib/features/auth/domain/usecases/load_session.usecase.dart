import 'package:prinstom/features/auth/domain/repositories/auth.repository.dart';

class LoadSessionUC {
  LoadSessionUC(this.iAuthRepository);
  final IAuthRepository iAuthRepository;
  FailureOrUser call() {
    return iAuthRepository.loadSession();
  }
}
