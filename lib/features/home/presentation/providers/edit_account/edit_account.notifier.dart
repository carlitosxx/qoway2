part of '../injects_container.provider.dart';

/// Clase
class EditAccountNotifier extends StateNotifier<EditAccountState> {
  /// Constructor
  EditAccountNotifier({
    required EditAccountUC editAccountUC,
    EditAccountState? initialState,
  })  : _editAccountUC = editAccountUC,
        super(initialState ?? const EditAccountState.initial());
  final EditAccountUC _editAccountUC;

  /// Resetea el estado a inicial
  void reset() => state = const EditAccountState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> editAccount(Account account, int userId) async {
    state = const EditAccountState.loading();
    final result = await _editAccountUC(account: account, userId: userId);
    result.when(
      left: (error) =>
          state = EditAccountState.error(mapFailureToString(error)),
      right: (response) => state = EditAccountState.data(
        account: response,
      ),
    );
  }
}
