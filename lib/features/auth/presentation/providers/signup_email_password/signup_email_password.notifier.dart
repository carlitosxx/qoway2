part of '../injects_container.provider.dart';

/// Clase
class SignupEmailPasswordNotifier
    extends StateNotifier<SignupEmailPasswordState> {
  /// Constructor
  SignupEmailPasswordNotifier({
    required SignupEmailPasswordUC signupEmailPasswordUC,
    SignupEmailPasswordState? initialState,
  })  : _signupEmailPasswordUC = signupEmailPasswordUC,
        super(initialState ?? const SignupEmailPasswordState.initial());
  final SignupEmailPasswordUC _signupEmailPasswordUC;

  /// Resetea el estado a inicial
  void reset() => state = const SignupEmailPasswordState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> signup(User user) async {
    state = const SignupEmailPasswordState.loading();
    final result = await _signupEmailPasswordUC(user: user);
    result.when(
      left: (error) =>
          state = SignupEmailPasswordState.error(mapFailureToString(error)),
      right: (response) => state = SignupEmailPasswordState.data(
        user: response,
      ),
    );
  }
}
