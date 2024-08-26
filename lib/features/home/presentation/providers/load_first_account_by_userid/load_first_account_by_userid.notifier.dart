part of '../injects_container.provider.dart';

/// Clase
class LoadFirstAccountByUserIdNotifier
    extends StateNotifier<LoadFirstAccountByUserIdState> {
  /// Constructor
  LoadFirstAccountByUserIdNotifier({
    required LoadFirstAccountByUserIdUC loadFirstAccountByUserIdUC,
    LoadFirstAccountByUserIdState? initialState,
  })  : _loadFirstAccountByUserIdUC = loadFirstAccountByUserIdUC,
        super(initialState ?? const LoadFirstAccountByUserIdState.initial());
  final LoadFirstAccountByUserIdUC _loadFirstAccountByUserIdUC;

  /// Resetea el estado a inicial
  void reset() => state = const LoadFirstAccountByUserIdState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> loadFirstAccountByUserId(int userId) async {
    state = const LoadFirstAccountByUserIdState.loading();
    final result = await _loadFirstAccountByUserIdUC(userId: userId);
    result.when(
        left: (error) => state =
            LoadFirstAccountByUserIdState.error(mapFailureToString(error)),
        right: (response) {
          setCurrentAccountId(response.id);
          return state = LoadFirstAccountByUserIdState.data(
            account: response,
          );
        });
  }
}
