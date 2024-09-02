import 'package:isar/isar.dart';
import 'package:prinstom/features/auth/data/models/sesion.model.dart';
import 'package:prinstom/features/auth/data/models/user.model.dart';
import 'package:prinstom/features/auth/domain/entities/account.entity.dart';

import '../../../../../config/isar/isar_singleton.dart';
import '../../../../../utils/either.util.dart';
import '../../../../../utils/errors/http_request.error.dart';
import '../../../../../utils/errors/models/bad_request.model.dart';
import '../../../domain/entities/user.entity.dart';
import '../../../domain/repositories/auth.repository.dart';

/// Clase abstracta del DataSource ISAR
abstract class IDataBaseIsarDataSource {
  FailureOrSigninEmailPassword signinEmailPassword({
    required String email,
    required String password,
  });
  FailureOrSignup signup({
    required User user,
  });
  void saveSesion({required User user});
}

class DataBaseIsarDataSourceImpl implements IDataBaseIsarDataSource {
  @override
  FailureOrSigninEmailPassword signinEmailPassword({
    required String email,
    required String password,
  }) async {
    final isar = await IsarSingleton.instance;
    final users = isar.userModels;
    final newUser = await users
        .filter()
        .emailEqualTo(email)
        .and()
        .passwordEqualTo(password)
        .findFirst();
    if (newUser == null) {
      return Either.left(HttpRequestFailure.notFound());
    }
    return Either.right(newUser.toDomain());
  }

  @override
  FailureOrSignup signup({
    required User user,
  }) async {
    try {
      final isar = await IsarSingleton.instance;
      if (await _findEmail(user.email, isar)) {
        return _emailAlreadyRegisteredError();
      }
      user.accounts = [
        Account(id: 0, description: 'Main', incomes: [], expenses: [])
      ];
      return _saveUserToIsar(user, isar);
    } on Exception catch (_) {
      return Either.left(HttpRequestFailure.local());
    }
  }

  @override
  void saveSesion({required User user}) async {
    final isar = await IsarSingleton.instance;
    final sesionModel = SesionModel(email: user.email, password: user.password);
    await isar.writeTxn(() async {
      await isar.sesionModels.delete(0);
      await isar.sesionModels.put(sesionModel);
    });
  }
}

// Metodos
Future<Either<HttpRequestFailure, User>> _saveUserToIsar(
  User user,
  Isar isar,
) async {
  final userModel = UserModel.fromDomain(user);
  await isar.writeTxn(() async {
    user.id = await isar.userModels.put(userModel);
  });
  return Either.right(user);
}

Future<Either<HttpRequestFailure, User>> _emailAlreadyRegisteredError() async {
  return Either.left(
    HttpRequestFailure.badRequest(
      BadRequestModel(
          statusCode: 404,
          message: [
            'El correo electrónico ya está registrado. Usa otro o inicia sesión.'
          ],
          error:
              'El correo electrónico ya está registrado. Usa otro o inicia sesión.'),
    ),
  );
}

Future<bool> _findEmail(
  String email,
  Isar isar,
) async {
  final user = isar.userModels;
  final userFound = await user.filter().emailEqualTo(email).findFirst();
  if (userFound == null) {
    return false;
  }
  return true;
}
