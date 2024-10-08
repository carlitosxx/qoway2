part of '../injects_container.provider.dart';

/// Clase
class LoadAccountByUserIdAndAccountIdNotifier
    extends StateNotifier<LoadAccountByUserIdAndAccountIdState> {
  /// Constructor
  LoadAccountByUserIdAndAccountIdNotifier({
    required LoadAccountByUserIdAndAccountIdUC
        loadAccountByUserIdAndAccountIdUC,
    LoadAccountByUserIdAndAccountIdState? initialState,
  })  : _loadAccountByUserIdAndAccountIdUC = loadAccountByUserIdAndAccountIdUC,
        super(initialState ??
            const LoadAccountByUserIdAndAccountIdState.initial());
  final LoadAccountByUserIdAndAccountIdUC _loadAccountByUserIdAndAccountIdUC;

  /// Resetea el estado a inicial
  void reset() => state = const LoadAccountByUserIdAndAccountIdState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> loadAccountByUserIdAndAccountId(
      int userId, int accountId) async {
    state = const LoadAccountByUserIdAndAccountIdState.loading();
    final result = await _loadAccountByUserIdAndAccountIdUC(
        accountId: accountId, userId: userId);
    result.when(
        left: (error) => state = LoadAccountByUserIdAndAccountIdState.error(
            mapFailureToString(error)),
        right: (response) {
          // aqui debo guardar el id del account en un provider
          setCurrentAccountId(response.id, userId);
          return state = LoadAccountByUserIdAndAccountIdState.data(
            account: response,
          );
        });
  }
}
