import 'package:i18n_extension/i18n_extension.dart';

/// ===Home_phone===
/// Constante: Marca
const kBrand = 'kBrand';

/// Constante: Texto Ingresos
const kIncomes = 'kIncomes';

/// Constante: Text Egresos
const kExpenses = 'kExpenses';

/// Constante: Lista de cuentas
const kListAccounts = 'kListAccounts';

/// Constante: Cuentas
const kAccounts = 'kAccounts';

/// Constante: Cerrar sesion
const kLogout = 'kLogout';

/// Constante: Crear cuenta
const kCreateAccount = 'kCreateAccount';

/// Constante: Ingrese una descripcion
const kHintEnterYourDescription = 'kHintEnterYourDescription';

/// Constante: Cerrar
const kClose = 'kClose';

/// Constante: Editar descripcion
const kEditDescription = 'kEditDescription';

/// Cadenas de traduccion
extension HomeStrings on String {
  static final _t = Translations.byId('en_us', {
    /// Auth_phone
    kBrand: {
      'en_us': 'Pringstom_en',
      'es_es': 'Pringstom_es',
    },
    kIncomes: {
      'en_us': 'Incomes',
      'es_es': 'Ingresos',
    },
    kExpenses: {
      'en_us': 'Expenses',
      'es_es': 'Egresos',
    },
    kListAccounts: {
      'en_us': 'List accounts',
      'es_es': 'Lista de cuentas',
    },
    kAccounts: {
      'en_us': 'Accounts',
      'es_es': 'Cuentas',
    },
    kLogout: {
      'en_us': 'Logout',
      'es_es': 'Cerrar sesión',
    },
    kCreateAccount: {
      'en_us': 'Create account',
      'es_es': 'Crear cuenta',
    },
    kHintEnterYourDescription: {
      'en_us': 'Enter a description',
      'es_es': 'Ingrese una descripcion',
    },
    kClose: {
      'en_us': 'Close',
      'es_es': 'Cerrar',
    },
    kEditDescription: {
      'en_us': 'Edit description',
      'es_es': 'Editar descripcion',
    }
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
