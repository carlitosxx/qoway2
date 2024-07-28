import '../entities/user.entity.dart';
import '../repositories/auth.repository.dart';

class SignUpUC {
  SignUpUC(this.iAuthRepository);
  final IAuthRepository iAuthRepository;
  FailureOrSignup call({required User user}) {
    return iAuthRepository.signupUser(user);
  }
}
