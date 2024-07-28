import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.util.freezed.dart';

/// Utilitario Either para recibir 2 resultados
@freezed
class Either<L, R> with _$Either<L, R> {
  /// Resultado izquierda (error)
  factory Either.left(L value) = _Left;

  /// Resultado derecha (correcto)
  factory Either.right(R value) = _Right;
}
