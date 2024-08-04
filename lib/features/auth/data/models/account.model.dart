// import 'package:isar/isar.dart';

// import '../../domain/entities/account.entity.dart';
// import '../../domain/entities/transaction.entity.dart';
// part 'account.model.g.dart';

// @Collection()
// class AccountModel {
//   AccountModel({
//     this.id,
//     required this.description,
//     required this.expenses,
//     required this.incomes,
//   });

//   int? id;

//   String description;

//   List<Transaction> expenses;

//   List<Transaction> incomes;
//   // Conversión desde y hacia la entidad de dominio
//   Account toDomain() {
//     return Account(
//       id: id,
//       description: description,
//       incomes: incomes.map((transaction) => transaction.toDomain()).toList(),
//       expenses: expenses.map((transaction) => transaction.toDomain()).toList(),
//     );
//   }

//   static AccountModel fromDomain(Account account) {
//     final accountModel = AccountModel()
//     ..id=account.id
//     ..description = account.description
//     ..incomes=account.incomes
//     ..expenses=account.expenses
//     ;

//     // Conversión de transacciones
//     accountModel.ingresos.addAll(account.ingresos
//         .map((transaction) => TransactionModel.fromDomain(transaction)));
//     accountModel.egresos.addAll(account.egresos
//         .map((transaction) => TransactionModel.fromDomain(transaction)));

//     return accountModel;
//   }
// }

// @Collection()
// class AccountModel {
//   Id id = Isar.autoIncrement;
//   late String nombre;
//   final ingresos = IsarLinks<TransactionModel>();
//   final egresos = IsarLinks<TransactionModel>();

  
// }
