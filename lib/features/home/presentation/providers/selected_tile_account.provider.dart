import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider para verificar cual de los 2 botones de navigation bar esta seleccionado
final tileAccountSelectedProvider = StateProvider<bool>((ref) {
  return false;
});
