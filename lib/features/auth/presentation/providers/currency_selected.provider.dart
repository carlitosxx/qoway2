import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/features/auth/domain/entities/currency.entity.dart';

/// Provider para la divisa seleccionada, para el registro de usuario
final currencySelectedProvider = StateProvider<Currency?>((ref) {
  return null;
});
