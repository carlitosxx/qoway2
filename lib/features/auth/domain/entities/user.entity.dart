class User {
  int? id;
  String name;
  String email;
  String password;
  String? descriptionCurrency;
  String? shortDescriptionCurrency;
  String? simbolCurrency;
  int? sideCurrency;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.descriptionCurrency,
    this.shortDescriptionCurrency,
    this.simbolCurrency,
    this.sideCurrency,
  });

  // // METODOS
  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //     'descriptionCurrency': descriptionCurrency,
  //     'shortDescriptionCurrency': shortDescriptionCurrency,
  //     'simbolCurrency': simbolCurrency,
  //     'sideCurrency': sideCurrency,
  //   };
  // }
}
