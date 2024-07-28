part of '../injects_container.provider.dart';

/// Clase
class SigninEmailPasswordNotifier
    extends StateNotifier<SigninEmailPasswordState> {
  /// Constructor
  SigninEmailPasswordNotifier({
    required SigninEmailPasswordUC signinEmailPasswordUC,
    SigninEmailPasswordState? initialState,
  })  : _signinEmailPasswordUC = signinEmailPasswordUC,
        super(initialState ?? const SigninEmailPasswordState.initial());
  final SigninEmailPasswordUC _signinEmailPasswordUC;

  /// Resetea el estado a inicial
  void reset() => state = const SigninEmailPasswordState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> signin(email, password) async {
    state = const SigninEmailPasswordState.loading();
    final result =
        await _signinEmailPasswordUC(email: email, password: password);
    result.when(
      left: (error) =>
          state = SigninEmailPasswordState.error(mapFailureToString(error)),
      right: (response) => state = SigninEmailPasswordState.data(
        user: response,
      ),
    );
  }
}
