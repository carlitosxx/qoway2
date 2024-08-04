import 'package:isar/isar.dart';
import 'package:prinstom/features/auth/data/models/user.model.dart';
import 'package:prinstom/utils/either.util.dart';
import 'package:prinstom/utils/errors/http_request.error.dart';

import '../../../../config/isar/isar_singleton.dart';
import '../../domain/repositories/home.repository.dart';

abstract class IDataBaseIsarDataSource {
  FailureOrAccount loadFirstAccountByUserId({required int userId});
  FailureOrAccount loadAccountByUserIdAndAccountId({
    required int userId,
    required int accountId,
  });
  FailureOrListAccounts loadListAccountsByUserId({
    required int userId,
  });
}

class DataBaseIsarDataSourceImpl implements IDataBaseIsarDataSource {
  @override
  FailureOrAccount loadAccountByUserIdAndAccountId({
    required int userId,
    required int accountId,
  }) async {
    try {
      final isar = await IsarSingleton.instance;
      final users = isar.userModels;
      final userFound = await users.filter().idEqualTo(userId).findFirst();
      if (userFound != null && userFound.accounts != null) {
        final accountFound = userFound.accounts!
            .firstWhere((account) => account.id == accountId);
        final account = UserModel.fromAccountModelToAccount(accountFound);
        return Either.right(account);
      }
      return Either.left(HttpRequestFailure.notFound());
    } on Exception catch (_) {
      return Either.left(HttpRequestFailure.local());
    }
  }

  @override
  FailureOrAccount loadFirstAccountByUserId({
    required int userId,
  }) async {
    try {
      final isar = await IsarSingleton.instance;
      final users = isar.userModels;
      final userFound = await users.filter().idEqualTo(userId).findFirst();
      if (userFound != null && userFound.accounts != null) {
        final firstAccount = userFound.accounts![0];
        final account = UserModel.fromAccountModelToAccount(firstAccount);
        return Either.right(account);
      }
      return Either.left(HttpRequestFailure.notFound());
    } on Exception catch (_) {
      return Either.left(HttpRequestFailure.local());
    }
  }

  @override
  FailureOrListAccounts loadListAccountsByUserId({
    required int userId,
  }) async {
    try {
      final isar = await IsarSingleton.instance;
      final users = isar.userModels;
      final userFound = await users.filter().idEqualTo(userId).findFirst();
      if (userFound != null && userFound.accounts != null) {
        final listAccounts = userFound.accounts!
            .map(
              (account) => UserModel.fromAccountModelToAccount(account),
            )
            .toList();
        return Either.right(listAccounts);
      }
      return Either.left(HttpRequestFailure.notFound());
    } on Exception catch (_) {
      return Either.left(HttpRequestFailure.local());
    }
  }
}
