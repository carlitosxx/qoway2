import 'package:isar/isar.dart';
import 'package:prinstom/features/auth/data/models/user.model.dart';
import 'package:prinstom/features/auth/domain/entities/account.entity.dart';
import 'package:prinstom/utils/either.util.dart';
import 'package:prinstom/utils/errors/http_request.error.dart';

import '../../../../config/isar/isar_singleton.dart';
import '../../../auth/domain/entities/transaction.entity.dart';
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
  FailureOrTransaction createTrasaction({
    required int userId,
    required int accountId,
    required Transaction transaction,
    required bool isIncome,
  });
  FailureOrAccount editAccount({
    required Account account,
    required int userId,
  });
  FailureOrListAccounts loadListAccountsByUserId({
    required int userId,
  });
  FailureOrListTransactions loadListIncomes({
    required int userId,
    required int accountId,
  });
  FailureOrListTransactions loadListExpenses({
    required int userId,
    required int accountId,
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
          /// No existe un model de usuario
          return Either.left(HttpRequestFailure.notFound());
        }
      } else {
        return Either.left(HttpRequestFailure.notFound());
      }
    } catch (e) {
      return Either.left(HttpRequestFailure.local());
    }
  }

  @override
  FailureOrTransaction createTrasaction({
    required int userId,
    required int accountId,
    required Transaction transaction,
    required bool isIncome,
  }) async {
    try {
      final isar = await IsarSingleton.instance;
      final userModel = await isar.userModels.get(userId);

      if (userModel != null) {
        final accountIndex =
            userModel.accounts?.indexWhere((acc) => acc.id == accountId);
        // valida si existe la cuenta y guarda el indice
        if (accountIndex != null && accountIndex != -1) {
          // final accountModel = userModel.accounts![accountIndex];
          final transactionModel =
              UserModel.fromTransactionToTransactionModel(transaction);
          // Agregar la transacción a la lista correspondiente
          if (isIncome) {
            transactionModel.id = getLastTransactionId(
              userModel,
              transactionModel,
              accountIndex,
              isIncome,
            );
            final listTransactionModel = List<TransactionModel>.from(
                userModel.accounts![accountIndex].incomes);
            listTransactionModel.add(transactionModel);
            userModel.accounts![accountIndex].incomes = listTransactionModel;
          } else {
            transactionModel.id = getLastTransactionId(
              userModel,
              transactionModel,
              accountIndex,
              isIncome,
            );
            final listTransactionModel = List<TransactionModel>.from(
                userModel.accounts![accountIndex].expenses);
            listTransactionModel.add(transactionModel);
            userModel.accounts![accountIndex].expenses = listTransactionModel;
          }
          // Actualizar la cuenta en el usuario
          // userModel.accounts![accountIndex] = accountModel;
          // Guardar los cambios en la base de datos
          await isar.writeTxn(
            () async {
              await isar.userModels.put(userModel);
            },
          );

          return Either.right(transaction);
        } else {
          /// No existe un model de cuenta del usuario
          return Either.left(HttpRequestFailure.notFound());
        }
      } else {
        /// No existe un model de usuario
        return Either.left(HttpRequestFailure.notFound());
      }
    } catch (e) {
      return Either.left(HttpRequestFailure.local());
    }
  }

  @override
  FailureOrListTransactions loadListIncomes(
      {required int userId, required int accountId}) async {
    try {
      final isar = await IsarSingleton.instance;
      final users = isar.userModels;
      final userFound = await users.filter().idEqualTo(userId).findFirst();
      if (userFound != null && userFound.accounts != null) {
        final accountFound = userFound.accounts!
            .firstWhere((account) => account.id == accountId);
        final listIncomesModel = accountFound.incomes;
        final listIncomes = listIncomesModel
            .map(
              (e) => UserModel.fromTransactionModelToTransaction(e),
            )
            .toList();
        return Either.right(listIncomes);
      }
      return Either.left(HttpRequestFailure.notFound());
    } catch (e) {
      return Either.left(HttpRequestFailure.local());
    }
  }

  @override
  FailureOrListTransactions loadListExpenses(
      {required int userId, required int accountId}) async {
    try {
      final isar = await IsarSingleton.instance;
      final users = isar.userModels;
      final userFound = await users.filter().idEqualTo(userId).findFirst();
      if (userFound != null && userFound.accounts != null) {
        final accountFound = userFound.accounts!
            .firstWhere((account) => account.id == accountId);
        final listExpensesModel = accountFound.expenses;
        final listExpenses = listExpensesModel
            .map(
              (e) => UserModel.fromTransactionModelToTransaction(e),
            )
            .toList();
        return Either.right(listExpenses);
      }
      return Either.left(HttpRequestFailure.notFound());
    } catch (e) {
      return Either.left(HttpRequestFailure.local());
    }
  }
}

int getLastTransactionId(UserModel userModel, TransactionModel transactionModel,
    int accountIndex, bool isIncome) {
  if (isIncome) {
    if (userModel.accounts![accountIndex].incomes.isNotEmpty) {
      final lastTransactionIdIncome = userModel.accounts![accountIndex].incomes
          .map((transaction) => transaction.id)
          .reduce((a, b) => a > b ? a : b);
      return lastTransactionIdIncome + 1;
    }
  } else {
    if (userModel.accounts![accountIndex].expenses.isNotEmpty) {
      final lastTransactionIdExpenses = userModel
          .accounts![accountIndex].expenses
          .map((transaction) => transaction.id)
          .reduce((a, b) => a > b ? a : b);
      return lastTransactionIdExpenses + 1;
    }
  }
  return 0;
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
