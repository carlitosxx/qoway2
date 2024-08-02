import 'package:prinstom/features/auth/domain/entities/user.entity.dart';

import 'package:isar/isar.dart';

part 'user.model.g.dart';

/// Modelo usuario
@Collection()
class UserModel implements User {
  UserModel({
    this.id,
    required this.email,
    required this.name,
    required this.password,
    this.shortDescriptionCurrency,
    this.descriptionCurrency,
    this.isSimbolLeft,
    this.simbolCurrency,
  });

  @override
  Id? id = Isar.autoIncrement;

  @override
  String email;

  @override
  String name;

  @override
  String password;

  @override
  String? shortDescriptionCurrency;

  @override
  String? descriptionCurrency;

  @override
  bool? isSimbolLeft;

  @override
  String? simbolCurrency;

  User toUser(UserModel usermodel) {
    return User(
      id: usermodel.id,
      email: usermodel.email,
      name: usermodel.name,
      password: usermodel.password,
      shortDescriptionCurrency: usermodel.shortDescriptionCurrency,
      descriptionCurrency: usermodel.descriptionCurrency,
      isSimbolLeft: usermodel.isSimbolLeft,
      simbolCurrency: usermodel.simbolCurrency,
    );
  }

  factory UserModel.fromUser(User user) {
    return UserModel(
      email: user.email,
      name: user.name,
      password: user.password,
      shortDescriptionCurrency: user.shortDescriptionCurrency,
      descriptionCurrency: user.descriptionCurrency,
      isSimbolLeft: user.isSimbolLeft,
      simbolCurrency: user.simbolCurrency,
    );
  }
}
