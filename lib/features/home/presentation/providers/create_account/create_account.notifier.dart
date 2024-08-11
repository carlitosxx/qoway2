part of '../injects_container.provider.dart';
// import 'create_account.state.dart';

/// Clase
class CreateAccountNotifier extends StateNotifier<CreateAccountState> {
  /// Constructor
  CreateAccountNotifier({
    required CreateAccountUC createAccountUC,
    CreateAccountState? initialState,
  })  : _createAccountUC = createAccountUC,
        super(initialState ?? const CreateAccountState.initial());
  final CreateAccountUC _createAccountUC;

  /// Resetea el estado a inicial
  void reset() => state = const CreateAccountState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> createAccount(String description, int userId) async {
    state = const CreateAccountState.loading();
    final result =
        await _createAccountUC(description: description, userId: userId);
    result.when(
      left: (error) =>
          state = CreateAccountState.error(mapFailureToString(error)),
      right: (response) => state = CreateAccountState.data(
        account: response,
      ),
    );
  }
}
