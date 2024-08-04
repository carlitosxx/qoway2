import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/auth/data/models/user.model.dart';

class IsarSingleton {
  static Isar? _instance;

  static Future<Isar> get instance async {
    if (_instance == null) {
      final dir = await getApplicationDocumentsDirectory();
      _instance = await Isar.open([UserModelSchema], directory: dir.path);
    }
    return _instance!;
  }
}
