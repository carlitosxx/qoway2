class Transaction {
  Transaction({
    this.id,
    required this.amount,
    required this.date,
    required this.description,
  });
  int? id;
  double amount;
  DateTime date;
  String description;
}
