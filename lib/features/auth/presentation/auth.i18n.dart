import 'package:i18n_extension/i18n_extension.dart';

/// ===Auth_phone===
/// Constante: Marca
const kBrand = 'kBrand';

/// Constante: Titulo
const kTitle = 'kTitle';

/// Constante: Texto del titulo
const kSignInMessage = 'kSignInMessage';

/// Constante: Texto de hint para el telefono
const kEnterYourPhone = 'kEnterYourPhone';

/// Constante: Texto de hint para el correo
const kEnterYourEmail = 'kEnterYourEmail';

/// Constante: Texto de hint para el password
const kEnterYourPassword = 'kEnterYourPassword';

/// Constante: Texto de Login
const kLogin = 'kLogin';

/// Constante: Boton de Cerrar
const kClose = 'kClose';

/// Constante: Olvidaste tu contraseña?
const kForgotPassword = 'kForgotPassword';

/// Constante: Recuperar contraseña
const kRecoverPassword = 'kRecoverPassword';

/// Constante: No tienes una cuenta?Registrate
const kNotHaveAccount = 'kNotHaveAccount';

/// Constante: Mensaje de Bienvenida
const kLoginMessage = 'kLoginMessage';

/// Constante: O tu puedes
const kOrYouCan = 'kOrYouCan';

/// Constante: Texto del boton siguiente
const kNext = 'kNext';

/// Constante: Crear una cuenta
const kCreateAnAccount = 'kCreateAnAccount';

/// Constante: Mansaje por dejar espacios vacios
const kMessageEmptyFields = 'kMessageEmptyFields';

/// ===Create_Account===
/// Constante: Titulo de registro
const kTitleSignup = 'kTitleSignup';

/// Constante: Mensaje de registro
const kMessageSignUp = 'kMessageSignUp';

/// Constante: hint contraseña
const kPassword = 'kPassword';

/// Constante: hint correo
const kEmail = 'kEmail';

/// Constante: mensaje de error al dejar espacios vacios
const kMessageErrorCreateAccount = 'kMessageErrorCreateAccount';

/// Constante:  hit para el dropdown de moneda
const kHintDropDownCurrency = 'kHintDropDownCurrency';

/// Constante: hit para nombre completo
const kHintFullName = 'kHintFullName';

/// Constante: Titulo Lista de divisas
const kTitleListCurrency = 'kTitleListCurrency';

/// Constante: Register

/// ===Validate_otp_phone===
/// Constante: titulo de appbar
const kTitleValidateOtpPhone = 'kTitleValidateOtpPhone';

/// Constante: porfavor ingrese su codigo
const kPleaseEnterYourCode = 'kPleaseEnterYourCode';

/// Constante: No recibiste un codigo?
const kDidntReceiveCode = 'kDidntReceiveCode';

/// Constante: reenviar
const kResend = 'kResend';

/// Constante: Puede reenviar nuevamente en x tiempo
const kCanResendIn = 'kCanResendIn';

/// ===Register_information_phone===
/// Constante: titulo de appbar
const kTitleRegisterInformationPhone = 'kTitleRegisterInformationPhone';

/// Constante: Boton registrar
const kRegister = 'kRegister';

/// Constante: Nombres
const kFirstName = 'kFirstName';

/// Constante: Apellidos
const kLastName = 'kLastName';

/// Constante: Cancelar
const kCancel = 'kCancel';

/// Constante: Vivo en Peru
const kLiveInPeru = 'kLiveInPeru';

/// Constante: Departamento
const kDepartment = 'kDepartment';

/// Constante: Selccione su departamento
const kSelectYourDepartment = 'kSelectYourDepartment';

/// Constante: Provincia
const kProvince = 'kProvince';

/// Constante: Seleccione su provincia
const kSelectYourProvince = 'kSelectYourProvince';

/// Constante: Distrito
const kDistrict = 'kDistrict';

/// Constante: Seleccione su distrito
const kSelectYourDistrict = 'kSelectYourDistrict';

/// Constante: Se olvido seleccionar su distrito
const kForgotSelectedYourDisctrict = 'kForgotSelectedYourDisctrict';

/// Constante: Acepto los terminos y condiciones
const kHasAcceptedTerms = 'kHasAcceptedTerms';

/// constante: Mensaje de error, aceptar los termino sy condiciones
const kTermsMessageError = 'kTermsMessageError';

/// Constante: Mensaje de requerimiento de informacion del usuario
const kMessageRequireInformation = 'kMessageRequireInformation';

/// Constante: Mensa de recuperacion de contraseña
const kMessageForgotPassword = 'kMessageForgotPassword';

/// Constante: Mensaje de error
const kRegisterMessageError = 'kRegisterMessageError';

/// Constante: Titulo de modal de alerta
const kAlert = 'kAlert';

/// Cadenas de traduccion
extension AuthStrings on String {
  static final _t = Translations.byId('en_us', {
    /// Auth_phone
    kBrand: {
      'en_us': 'Pringstom_en',
      'es_es': 'Pringstom_es',
    },
    kTitle: {
      'en_us': 'Let us begin',
      'es_es': 'Comencemos',
    },
    kSignInMessage: {
      'en_us': 'Please, enter your account',
      'es_es': 'Por favor, ingrese su cuenta',
    },
    kEnterYourPhone: {
      'en_us': 'Enter your phone number',
      'es_es': 'Ingrese su celular',
    },
    kEnterYourEmail: {
      'en_us': 'Enter your email address',
      'es_es': 'Ingrese su correo electronico',
    },
    kEnterYourPassword: {
      'en_us': 'Enter your password',
      'es_es': 'Ingrese su contraseña',
    },
    kLogin: {
      'en_us': 'Login',
      'es_es': 'Iniciar Sesión',
    },
    kClose: {
      'en_us': 'Close',
      'es_es': 'Cerrar',
    },
    kForgotPassword: {
      'en_us': 'Forgot password?',
      'es_es': 'Olvidaste tu contraseña?',
    },
    kRecoverPassword: {
      'en_us': 'Recover password',
      'es_es': 'Recuperar contraseña',
    },
    kNotHaveAccount: {
      'en_us': "Don't have an account? !Sign up!",
      'es_es': 'No tienes una cuenta? ¡Registrate!',
    },
    kLoginMessage: {
      'en_us': 'Please, enter your email and password',
      'es_es': 'Por favor, ingrese su correo y contraseña',
    },
    kOrYouCan: {
      'en_us': 'Or you can',
      'es_es': 'O puedes',
    },
    kCreateAnAccount: {
      'en_us': 'Create an account',
      'es_es': 'Crear una cuenta',
    },
    kNext: {
      'en_us': 'Next',
      'es_es': 'Siguiente',
    },
    kMessageEmptyFields: {
      'en_us': 'Do not leave any spaces blank, all fields are mandatory.',
      'es_es': 'No deje espacios vacios,todos los campos son obligatorios',
    },

    /// Create_Account
    kTitleSignup: {
      'en_us': 'Sign Up',
      'es_es': 'Nuevo registro',
    },
    kMessageSignUp: {
      'en_us': 'Register your information to create a new account.',
      'es_es': 'Registro sus datos para crear una nueva cuenta',
    },
    kEmail: {
      'en_us': 'Email',
      'es_es': 'Correo electronico',
    },
    kMessageErrorCreateAccount: {
      'en_us': 'All fields are required',
      'es_es': 'Todos los campos son obligatorios, no deje espacios en blanco',
    },
    kPassword: {
      'en_us': 'Password',
      'es_es': 'Contraseña',
    },
    kHintDropDownCurrency: {
      'en_us': 'Select your currency',
      'es_es': 'Seleccione su divisa',
    },
    kHintFullName: {
      'en_us': 'Enter your full name',
      'es_es': 'Ingrese su nombre completo',
    },
    kTitleListCurrency: {
      'en_us': 'List currency',
      'es_es': 'Lista de divisas',
    },

    /// Validate_otp_phone
    kTitleValidateOtpPhone: {
      'en_us': 'Verify your phone',
      'es_es': 'Verifique su numero',
    },
    kPleaseEnterYourCode: {
      'en_us': 'We send an SMS to: %s\n please enter your code',
      'es_es': 'Le enviamos un sms al: %s\n por favor ingrese su codigo',
    },
    kDidntReceiveCode: {
      'en_us': "Didn't receive a code?",
      'es_es': 'No recibiste un codigo?',
    },
    kResend: {
      'en_us': 'Resend',
      'es_es': 'Reenviar',
    },
    kCanResendIn: {
      'en_us': 'You can resend again in: %s',
      'es_es': 'Podras reenviar nuevamente en: %s',
    },

    /// register_information_phone
    kTitleRegisterInformationPhone: {
      'en_us': 'Register information',
      'es_es': 'Registro de información',
    },
    kRegister: {
      'en_us': 'Register',
      'es_es': 'Registrar',
    },
    kFirstName: {
      'en_us': 'First Name',
      'es_es': 'Nombres',
    },
    kLastName: {
      'en_us': 'Last Name',
      'es_es': 'Apellidos',
    },

    kLiveInPeru: {
      'en_us': 'I live in Perú',
      'es_es': 'Vivo en Perú',
    },
    kCancel: {
      'en_us': 'Cancel',
      'es_es': 'Cancelar',
    },
    kDepartment: {
      'en_us': 'Department',
      'es_es': 'Departamento',
    },
    kSelectYourDepartment: {
      'en_us': 'Select your department',
      'es_es': 'Seleccione su departamento',
    },
    kProvince: {
      'en_us': 'Province',
      'es_es': 'Provincia',
    },
    kSelectYourProvince: {
      'en_us': 'Select your province',
      'es_es': 'Seleccione su provincia',
    },
    kDistrict: {
      'en_us': 'District',
      'es_es': 'Distrito',
    },
    kSelectYourDistrict: {
      'en_us': 'Select your district',
      'es_es': 'Seleccione su distrito',
    },
    kForgotSelectedYourDisctrict: {
      'en_us': 'You forgot to select your district',
      'es_es': 'Se olvido de seleccionar su distrito',
    },
    kHasAcceptedTerms: {
      'en_us': 'I accept the terms and conditions.',
      'es_es': 'Acepto los terminos y condiciones.',
    },
    kMessageRequireInformation: {
      'en_us': '''
The following information is required 
for the correct functioning of the application''',
      'es_es': '''
La siguiente informacion es requerida para
el correcto funcionamiento de la aplicacion''',
    },
    kMessageForgotPassword: {
      'en_us': '''
please enter your email address to recieve a verification link''',
      'es_es': '''
Por favor ingrese su direccion de correo electrónico
para recibir un enlace de recuperación''',
    },
    kRegisterMessageError: {
      'en_us': 'all the fields'
          ' are mandatory for registration.',
      'es_es': 'Todos los campos son obligatorios para registrarte',
    },
    kTermsMessageError: {
      'en_us': 'It is required to accept the terms '
          'and conditions for your registration.',
      'es_es':
          'Es requerido aceptar los terminos y condiciones para su registro',
    },

    kAlert: {
      'en_us': 'Alert',
      'es_es': 'Atencion',
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
