import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../../utils/either.util.dart';
import '../../../../utils/errors/http_request.error.dart';
import '../../domain/repositories/home.repository.dart';
import '../datasources/db_isar.datasource.dart';

class HomeRepositoryImpl implements IHomeRepository {
  HomeRepositoryImpl({required this.dataBaseIsarDataSourceImpl});
  final IDataBaseIsarDataSource dataBaseIsarDataSourceImpl;
  @override
  FailureOrAccount loadAccountByUserIdAndAccountId(
      int userId, int accountId) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return dataBaseIsarDataSourceImpl.loadAccountByUserIdAndAccountId(
        accountId: accountId,
        userId: userId,
      );
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }

  @override
  FailureOrAccount loadFirstAccountByUserId(int userId) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return dataBaseIsarDataSourceImpl.loadFirstAccountByUserId(
        userId: userId,
      );
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }

  @override
  FailureOrListAccounts loadListAccountsByUserId(int userId) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return dataBaseIsarDataSourceImpl.loadListAccountsByUserId(
        userId: userId,
      );
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }
}
