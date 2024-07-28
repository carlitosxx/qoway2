import '../repositories/auth.repository.dart';

class SigninEmailPasswordUC {
  SigninEmailPasswordUC(this.iAuthRepository);
  final IAuthRepository iAuthRepository;
  FailureOrSigninEmailPassword call({
    required String email,
    required String password,
  }) {
    return iAuthRepository.signinEmailPassword(
      email,
      password,
    );
  }
}
