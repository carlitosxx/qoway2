import 'package:prinstom/features/auth/domain/entities/user.entity.dart';

import 'package:isar/isar.dart';

part 'user.model.g.dart';

/// Modelo usuario
@Collection()
class UserModel implements User {
  UserModel({
    required this.email,
    required this.name,
    required this.password,
  });

  Id isarId = Isar.autoIncrement; // ID específico para Isar
  @override
  int? id;

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
  int? sideCurrency;

  @override
  String? simbolCurrency;
}
