import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:prinstom/features/auth/domain/entities/account.entity.dart';
import 'package:prinstom/features/auth/domain/entities/transaction.entity.dart';

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

  @override
  FailureOrAccount createAccount(String description, int userId) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return dataBaseIsarDataSourceImpl.createAccount(
        description: description,
        userId: userId,
      );
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }

  @override
  FailureOrAccount editAccount(Account account, int userId) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return dataBaseIsarDataSourceImpl.editAccount(
        account: account,
        userId: userId,
      );
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }

  @override
  FailureOrTransaction createTransaction(
      int userId, int accountId, Transaction transaction, bool isIncome) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return dataBaseIsarDataSourceImpl.createTrasaction(
        userId: userId,
        accountId: accountId,
        transaction: transaction,
        isIncome: isIncome,
      );
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }

  @override
  FailureOrListTransactions loadListIncomes(int userId, int accountId) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return dataBaseIsarDataSourceImpl.loadListIncomes(
        userId: userId,
        accountId: accountId,
      );
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }

  @override
  FailureOrListTransactions loadListExpenses(int userId, int accountId) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return dataBaseIsarDataSourceImpl.loadListExpenses(
        userId: userId,
        accountId: accountId,
      );
    } else {
      return Either.left(
        HttpRequestFailure.network(),
      );
    }
  }
}
