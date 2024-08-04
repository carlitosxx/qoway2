import 'transaction.entity.dart';

class Account {
  Account({
    required this.id,
    required this.description,
    required this.incomes,
    required this.expenses,
  });
  int id;
  String description;
  List<Transaction> incomes;
  List<Transaction> expenses;
}
