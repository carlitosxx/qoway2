// import 'package:i18n_extension/i18n_extension.dart';
// import 'package:i18n_extension/i18n_widget.dart';
import 'package:i18n_extension/i18n_extension.dart';

/// ===Global===
/// Constante: Marca
const kWarning = 'kWarning';

/// Constante: Alerta
const kAlert = 'kAlert';

/// Constante: Mensaje de error cuando no tiene conexion
const kNoNetworkMessage = 'kNoNetworkMessage';

/// Constante: Contenido no encontrado
const kNotFoundMessage = 'kNotFound';

/// Constante: Error en el servidor
const kServerMessage = 'kServerError';

/// Constante: Error de autorizacion
const kUnauthorizedMessage = 'kUnauthorizedMessage';

/// Constante: ERror para usuarios Inhabilitados
const kForbiddenMessage = 'kForbiddenMessage';

/// Constante: Error en el codigo de del frontend(movil) o desconocido
const kLocal = 'kLocal';

/// Constante: Boton de Cerrar
const kClose = 'lClose';

/// Cadenas de traduccion
extension GlobalStrings on String {
  static final _t = Translations.byId('en_us', {
    /// Auth_phone
    kWarning: {
      'en_us': '¡Warning!',
      'es_es': '¡Advertencia!',
    },
    kAlert: {
      'en_us': 'Alert',
      'es_es': 'Atencion',
    },
    kNoNetworkMessage: {
      'en_us': 'There was a problem with your internet connection, '
          'please check your network and try again',
      'es_es': 'Hubo un problema en la conexión de tu internet, '
          'por favor comprueba tu red e intente nuevamente',
    },
    kNotFoundMessage: {
      'en_us': 'The requested resource was not found',
      'es_es': 'El recurso solicitado no fue encontrado',
    },
    kServerMessage: {
      'en_us': 'There was a problem on the server, please contact us',
      'es_es':
          'Hubo un problema en el servidor, por favor contáctese con nosotros',
    },
    kUnauthorizedMessage: {
      'en_us': 'You are not authenticated to view this resource, please log in',
      'es_es':
          'No estas autenticado para ver este recurso, por favor identifiquese',
    },
    kForbiddenMessage: {
      'en_us': 'Your account has been disabled, contact support',
      'es_es': 'Su cuenta ha sido inhabilitada, contacte al area de soporte',
    },
    kLocal: {
      'en_us': 'There was a local or unknown problem, please contact us',
      'es_es': 'Hubo un problema local o desconocido, por favor contáctenos',
    },
    kClose: {
      'en_us': 'Close',
      'es_es': 'Cerrar',
    },
  });

  /// Getter to translate the string
  String get i18n => localize(this, _t);

  /// Method for interpolating strings
  String fill(List<Object> params) => localizeFill(this, params);

  /// Method for pluralizing strings
  String plural(int value) => localizePlural(value, this, _t);

  /// Method for creating custom modifiers according to any conditions
  String version(Object modifier) => localizeVersion(modifier, this, _t);

  /// Method for retrieving all the custom modifiers
  Map<String?, String> allVersions() => localizeAllVersions(this, _t);
}
