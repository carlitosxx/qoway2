import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prinstom/features/auth/data/models/user.model.dart';
import 'package:prinstom/utils/either.util.dart';
import 'package:prinstom/utils/errors/http_request.error.dart';
import 'package:prinstom/utils/errors/models/bad_request.model.dart';

import '../../../domain/entities/user.entity.dart';
import '../../../domain/repositories/auth.repository.dart';

/// Clase abstracta del DataSource ISAR
abstract class IDataBaseIsarDataSource {
  FailureOrSigninEmailPassword signinEmailPassword(
      {required String email, required String password});
  FailureOrSignup signup({required User user});
}

class DataBaseIsarDataSourceImpl implements IDataBaseIsarDataSource {
  @override
  FailureOrSigninEmailPassword signinEmailPassword(
      {required String email, required String password}) async {
    final dir = await getApplicationDocumentsDirectory();
    final instanceIsar = Isar.getInstance();
    if (instanceIsar == null) {
      final isar = await Isar.open([UserModelSchema], directory: dir.path);
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
      return Either.right(newUser);
    }
    final users = instanceIsar.userModels;
    final newUser = await users
        .filter()
        .emailEqualTo(email)
        .and()
        .passwordEqualTo(password)
        .findFirst();
    if (newUser == null) {
      return Either.left(HttpRequestFailure.notFound());
    }
    return Either.right(newUser);
  }

  @override
  FailureOrSignup signup({required User user}) async {
    try {
      final isar = await _validateInstance();
      if (await _findEmail(user.email, isar)) {
        return _emailAlreadyRegisteredError();
      }
      return _saveUserToIsar(user, isar);
    } on Exception catch (_) {
      return Either.left(HttpRequestFailure.local());
    }
  }
}

_saveUserToIsar(User user, Isar isar) async {
  final userModel = UserModel.fromUser(user);
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

Future<bool> _findEmail(String email, Isar isar) async {
  final user = isar.userModels;
  final userFound = await user.filter().emailEqualTo(email).findFirst();
  if (userFound == null) {
    return false;
  }
  return true;
}

Future<Isar> _validateInstance() async {
  final dir = await getApplicationDocumentsDirectory();
  final instanceIsar = Isar.getInstance();
  if (instanceIsar == null) {
    final isar = await Isar.open([UserModelSchema], directory: dir.path);
    return isar;
  }
  return instanceIsar;
}
