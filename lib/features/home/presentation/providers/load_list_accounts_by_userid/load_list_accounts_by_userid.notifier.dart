part of '../injects_container.provider.dart';

/// Clase
class LoadListAccountsByUserIdNotifier
    extends StateNotifier<LoadListAccountsByUserIdState> {
  /// Constructor
  LoadListAccountsByUserIdNotifier({
    required LoadListAccountsByUserIdUC loadListAccountsByUserIdUC,
    LoadListAccountsByUserIdState? initialState,
  })  : _loadListAccountsByUserIdUC = loadListAccountsByUserIdUC,
        super(initialState ?? const LoadListAccountsByUserIdState.initial());
  final LoadListAccountsByUserIdUC _loadListAccountsByUserIdUC;

  /// Resetea el estado a inicial
  void reset() => state = const LoadListAccountsByUserIdState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> loadListAccountsByUserId(int userId) async {
    state = const LoadListAccountsByUserIdState.loading();
    final result = await _loadListAccountsByUserIdUC(userId: userId);
    result.when(
      left: (error) => state =
          LoadListAccountsByUserIdState.error(mapFailureToString(error)),
      right: (response) => state = LoadListAccountsByUserIdState.data(
        accounts: response,
      ),
    );
  }
}
