part of '../injects_container.provider.dart';

/// Clase
class CreateTransactionNotifier extends StateNotifier<CreateTransactionState> {
  /// Constructor
  CreateTransactionNotifier({
    required CreateTransactionUC createTransactionUC,
    CreateTransactionState? initialState,
  })  : _createTransactionUC = createTransactionUC,
        super(initialState ?? const CreateTransactionState.initial());
  final CreateTransactionUC _createTransactionUC;

  /// Resetea el estado a inicial
  void reset() => state = const CreateTransactionState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> createTransaction(
      int userId, int accountId, Transaction transaction, bool isIncome) async {
    state = const CreateTransactionState.loading();
    final result = await _createTransactionUC(
      userId: userId,
      accountId: accountId,
      transaction: transaction,
      isIncome: isIncome,
    );
    result.when(
      left: (error) =>
          state = CreateTransactionState.error(mapFailureToString(error)),
      right: (response) => state = CreateTransactionState.data(
        transaction: response,
      ),
    );
  }
}
