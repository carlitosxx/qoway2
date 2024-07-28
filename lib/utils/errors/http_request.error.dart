import 'package:freezed_annotation/freezed_annotation.dart';
import 'models/bad_request.model.dart';
part 'http_request.error.freezed.dart';

/// Clase para validar el tipo de error en una peticion http
@freezed
class HttpRequestFailure with _$HttpRequestFailure {
  /// Respuesta de error sobre la red
  factory HttpRequestFailure.network() = _Network;

  /// Respuesta de error, que no encontro el recurso
  factory HttpRequestFailure.notFound() = _NotFound;

  /// Respuesta de error sobre una falla en el codigo del servidor
  factory HttpRequestFailure.server() = _Server;

  /// REspuesta de prohibicion al acceso por usuario inhabilitado
  factory HttpRequestFailure.forbidden() = _Forbidden;

  /// Respuesta de error sobre no estar autorizado
  factory HttpRequestFailure.unauthorized() = _Unauthorized;

  /// Respuesta mala de una peticion
  factory HttpRequestFailure.badRequest(BadRequestModel dataError) =
      _BadRequest;

  /// Respuesta de error sobre el dispositivo
  factory HttpRequestFailure.local() = _Local;
}
