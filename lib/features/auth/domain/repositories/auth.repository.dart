import '../../../../utils/either.util.dart';
import '../../../../utils/errors/http_request.error.dart';
import '../entities/user.entity.dart';

typedef FailureOrSigninEmailPassword = Future<Either<HttpRequestFailure, User>>;
typedef FailureOrSignup = Future<Either<HttpRequestFailure, User>>;
typedef FailureOrUser = Future<Either<HttpRequestFailure, User>>;
// typedef FailureOrLogout = Future<Either<HttpRequestFailure, void>>;
// typedef FailureOrRegister = Future<Either<HttpRequestFailure, User?>>;
// typedef FailureOrRecoverPassword = Future<Either<HttpRequestFailure, bool>>;

abstract class IAuthRepository {
  FailureOrSigninEmailPassword signinEmailPassword(
      String email, String password);
  FailureOrSignup signupUser(User user);
  FailureOrUser loadSession();
  // FailureOrLogout logout();
  // FailureOrRegister register(
  //   String email,
  //   String password,
  //   String firstName,
  //   String lastName,
  //   int idDistrict,
  // );
  // FailureOrRecoverPassword recoverPassword(String email);

  // Stream<User?> authStateChange();
}
