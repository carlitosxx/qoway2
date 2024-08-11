import 'package:isar/isar.dart';
import 'package:prinstom/features/auth/data/models/user.model.dart';
import 'package:prinstom/features/auth/domain/entities/account.entity.dart';
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
  FailureOrAccount createAccount({
    required String description,
    required int userId,
  });

  FailureOrAccount editAccount({required Account account, required int userId});
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

  @override
  FailureOrAccount createAccount({
    required String description,
    required int userId,
  }) async {
    try {
      final isar = await IsarSingleton.instance;
      final userModel = await isar.userModels.get(userId);
      if (userModel != null) {
        final lastAccountId = await getLastAccountId(isar, userId);
        final newAccountModel = AccountModel()
          ..id = lastAccountId + 1
          ..description = description.trim()
          ..incomes = []
          ..expenses = [];

        final updatedAccounts =
            List<AccountModel>.from(userModel.accounts ?? []);
        updatedAccounts.add(newAccountModel);
        userModel.accounts = updatedAccounts;

        await isar.writeTxn(
          () async {
            await isar.userModels.put(userModel);
          },
        );
        final newAccountEntity =
            UserModel.fromAccountModelToAccount(newAccountModel);
        return Either.right(newAccountEntity);
      } else {
        return Either.left(HttpRequestFailure.notFound());
      }
    } on Exception catch (_) {
      return Either.left(HttpRequestFailure.local());
    }
  }

  @override
  FailureOrAccount editAccount(
      {required Account account, required int userId}) async {
    try {
      final isar = await IsarSingleton.instance;
      final userModel = await isar.userModels.get(userId);
      if (userModel != null) {
        final accountIndex =
            userModel.accounts?.indexWhere((acc) => acc.id == account.id);
        if (accountIndex != null && accountIndex != -1) {
          // Actualizar la cuenta con los nuevos valores
          final updatedAccounts =
              List<AccountModel>.from(userModel.accounts ?? []);

          updatedAccounts[accountIndex] = updatedAccounts[accountIndex]
            ..description = account.description;

          userModel.accounts = updatedAccounts;

          // Guardar el usuario actualizado en la base de datos
          await isar.writeTxn(
            () async {
              await isar.userModels.put(userModel);
            },
          );

          // Retornar la cuenta actualizada
          return Either.right(account);
        } else {
          return Either.left(HttpRequestFailure.notFound());
        }
      } else {
        return Either.left(HttpRequestFailure.notFound());
      }
    } catch (e) {
      return Either.left(HttpRequestFailure.local());
    }
    // throw UnimplementedError();
  }
}

Future<int> getLastAccountId(Isar isar, int userId) async {
  final userModel = await isar.userModels.get(userId);
  if (userModel != null &&
      userModel.accounts != null &&
      userModel.accounts!.isNotEmpty) {
    final lastAccountId = userModel.accounts!
        .map((account) => account.id)
        .reduce((a, b) => a > b ? a : b);
    return lastAccountId;
  } else {
    return 0;
  }
}
