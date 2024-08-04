import 'account.entity.dart';

class User {
  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.descriptionCurrency,
    this.shortDescriptionCurrency,
    this.simbolCurrency,
    this.isSimbolLeft,
    this.accounts,
  });
  int? id;
  String name;
  String email;
  String password;
  String? descriptionCurrency;
  String? shortDescriptionCurrency;
  String? simbolCurrency;
  bool? isSimbolLeft;
  List<Account>? accounts = [];
}
