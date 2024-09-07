import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../../utils/either.util.dart';
import '../../../../utils/errors/http_request.error.dart';
import '../../domain/entities/user.entity.dart';
import '../../domain/repositories/auth.repository.dart';
import '../datasources/local/db_isar.datasource.dart';

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl({required this.dataBaseIsarDataSourceImpl});
  final IDataBaseIsarDataSource dataBaseIsarDataSourceImpl;
  @override
  FailureOrSigninEmailPassword signinEmailPassword(
      String email, String password) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final resultSign = dataBaseIsarDataSourceImpl.signinEmailPassword(
        email: email,
        password: password,
      );
      final resultFuture = await resultSign;
      resultFuture.whenOrNull(
          right: (value) => dataBaseIsarDataSourceImpl.saveSesion(user: value));
      return resultSign;
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }

  @override
  FailureOrSignup signupUser(User user) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return dataBaseIsarDataSourceImpl.signup(user: user);
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }

  @override
  FailureOrUser loadSession() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return dataBaseIsarDataSourceImpl.loadSession();
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }
}
