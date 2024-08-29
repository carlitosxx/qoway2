part of '../injects_container.provider.dart';

/// Clase
class LoadListExpensesNotifier extends StateNotifier<LoadListExpensesState> {
  /// Constructor
  LoadListExpensesNotifier({
    required LoadListExpensesUC loadListExpensesUC,
    LoadListExpensesState? initialState,
  })  : _loadListExpensesUC = loadListExpensesUC,
        super(initialState ?? const LoadListExpensesState.initial());
  final LoadListExpensesUC _loadListExpensesUC;

  /// Resetea el estado a inicial
  void reset() => state = const LoadListExpensesState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> loadListExpenses(int userId, int accountId) async {
    state = const LoadListExpensesState.loading();
    final result =
        await _loadListExpensesUC(userId: userId, accountId: accountId);
    result.when(
      left: (error) =>
          state = LoadListExpensesState.error(mapFailureToString(error)),
      right: (response) => state = LoadListExpensesState.data(
        listTransactions: response,
      ),
    );
  }
}
