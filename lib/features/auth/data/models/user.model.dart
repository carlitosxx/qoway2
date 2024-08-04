import 'package:isar/isar.dart';
import 'package:prinstom/features/auth/domain/entities/account.entity.dart';
import 'package:prinstom/features/auth/domain/entities/transaction.entity.dart';

import '../../domain/entities/user.entity.dart';
part 'user.model.g.dart';

/// Modelo usuario
@Collection()
class UserModel {
  UserModel({
    this.id,
    required this.email,
    required this.name,
    required this.password,
    this.shortDescriptionCurrency,
    this.descriptionCurrency,
    this.isSimbolLeft,
    this.simbolCurrency,
    this.accounts,
  });

  Id? id = Isar.autoIncrement;
  String name;
  String email;
  String password;
  String? shortDescriptionCurrency;
  String? descriptionCurrency;
  bool? isSimbolLeft;
  String? simbolCurrency;
  List<AccountModel>? accounts;
  // Conversión hacia la entidad de dominio
  User toDomain() {
    return User(
      id: id,
      name: name,
      email: email,
      password: password,
      shortDescriptionCurrency: shortDescriptionCurrency,
      descriptionCurrency: descriptionCurrency,
      isSimbolLeft: isSimbolLeft,
      simbolCurrency: simbolCurrency,
      accounts: (accounts == null)
          ? []
          : accounts!
              .map((account) => fromAccountModelToAccount(account))
              .toList(),
    );
  }

  static Account fromAccountModelToAccount(AccountModel accountModel) {
    return Account(
      id: accountModel.id,
      description: accountModel.description,
      incomes: accountModel.incomes
          .map(
            (transactionModel) =>
                fromTransactionModelToTransaction(transactionModel),
          )
          .toList(),
      expenses: accountModel.expenses
          .map(
            (transactionModel) =>
                fromTransactionModelToTransaction(transactionModel),
          )
          .toList(),
    );
  }

  static Transaction fromTransactionModelToTransaction(
      TransactionModel transactionModel) {
    return Transaction(
        id: transactionModel.id,
        amount: transactionModel.amount,
        date: transactionModel.date,
        description: transactionModel.description);
  }

  factory UserModel.fromDomain(User user) {
    final userModel = UserModel(
      email: user.email,
      name: user.name,
      password: user.password,
      shortDescriptionCurrency: user.shortDescriptionCurrency,
      descriptionCurrency: user.descriptionCurrency,
      isSimbolLeft: user.isSimbolLeft,
      simbolCurrency: user.simbolCurrency,
      // accounts: user.accounts.map((accounts)=>Accoun)
    );

    // Conversión de cuentas

    userModel.accounts = (user.accounts != null)
        ? user.accounts!.map((account) {
            final accountModel = AccountModel();
            accountModel.id = account.id;
            accountModel.description = account.description;
            accountModel.expenses = account.expenses.map((transaction) {
              final transactionModel = TransactionModel();
              transactionModel.id = transaction.id ?? 0;
              transactionModel.description = transaction.description;
              transactionModel.amount = transaction.amount;
              transactionModel.date = transaction.date;
              return transactionModel;
            }).toList();

            accountModel.incomes = account.incomes.map((transaction) {
              final transactionModel = TransactionModel();
              transactionModel.id = transaction.id ?? 0;
              transactionModel.description = transaction.description;
              transactionModel.amount = transaction.amount;
              transactionModel.date = transaction.date;
              return transactionModel;
            }).toList();

            return accountModel;
          }).toList()
        : [];

    return userModel;
  }
}

@embedded
class AccountModel {
  late int id;

  late String description;

  late List<TransactionModel> expenses;

  late List<TransactionModel> incomes;
}

@embedded
class TransactionModel {
  late int id;
  late String description;
  late double amount;
  late DateTime date;
}
