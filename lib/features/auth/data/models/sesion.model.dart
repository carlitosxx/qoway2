import 'package:isar/isar.dart';
part 'sesion.model.g.dart';

@Collection()
class SesionModel {
  SesionModel({required this.email, required this.password});
  Id id = 0;
  String email;
  String password;
}
