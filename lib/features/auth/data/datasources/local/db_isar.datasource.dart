import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prinstom/features/auth/data/models/user.model.dart';
import 'package:prinstom/utils/either.util.dart';
import 'package:prinstom/utils/errors/http_request.error.dart';

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
    // final isar = await Isar.open([UserModelSchema], directory: dir.path);
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
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [UserModelSchema],
        directory: dir.path,
      );
      final userModel = UserModel(
        email: user.email,
        name: user.name,
        password: user.password,
      );
      isar.writeTxn(() async {
        await isar.userModels.put(userModel);
      });
      return Either.right(user);
    } on Exception catch (_) {
      return Either.left(HttpRequestFailure.local());
    }
  }
}
