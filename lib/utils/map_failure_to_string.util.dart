import 'package:custom_widgets/custom_widgets.dart';
import 'error_mapping.util.dart';
import 'errors/http_request.error.dart';
import 'global.i18n.dart';

/// Mapea las fallas a una cadena
ErrorMapping mapFailureToString(HttpRequestFailure failure) {
  return failure.when(
    network: () => ErrorMapping(
      messageError: kNoNetworkMessage.i18n,
      painter: NoConectionCP(),
      titleError: kWarning.i18n,
    ),
    notFound: () => ErrorMapping(
      messageError: kNotFoundMessage.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
    server: () => ErrorMapping(
      messageError: kServerMessage.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
    forbidden: () => ErrorMapping(
      messageError: kForbiddenMessage.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
    unauthorized: () => ErrorMapping(
      messageError: kUnauthorizedMessage.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
    badRequest: (error) {
      if (error.message.isNotEmpty) {
        final errorMessage = error.message.join('\n');
        return ErrorMapping(
          messageError: errorMessage,
          painter: WarningCP(),
          titleError: kAlert.i18n,
        );
      }
      return ErrorMapping(
        messageError: 'Hubo un problema al recibir el mensaje de error',
        painter: WarningCP(),
        titleError: kWarning.i18n,
      );
    },
    local: () => ErrorMapping(
      messageError: kLocal.i18n,
      painter: WarningCP(),
      titleError: kWarning.i18n,
    ),
  );
}
