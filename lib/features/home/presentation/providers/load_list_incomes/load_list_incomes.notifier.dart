part of '../injects_container.provider.dart';

/// Clase
class LoadListIncomesNotifier extends StateNotifier<LoadListIncomesState> {
  /// Constructor
  LoadListIncomesNotifier({
    required LoadListIncomesUC loadListIncomesUC,
    LoadListIncomesState? initialState,
  })  : _loadListIncomesUC = loadListIncomesUC,
        super(initialState ?? const LoadListIncomesState.initial());
  final LoadListIncomesUC _loadListIncomesUC;

  /// Resetea el estado a inicial
  void reset() => state = const LoadListIncomesState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> loadListIncomes(int userId, int accountId) async {
    state = const LoadListIncomesState.loading();
    final result =
        await _loadListIncomesUC(userId: userId, accountId: accountId);
    result.when(
      left: (error) =>
          state = LoadListIncomesState.error(mapFailureToString(error)),
      right: (response) => state = LoadListIncomesState.data(
        listTransactions: response,
      ),
    );
  }
}
