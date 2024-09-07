part of '../injects_container.provider.dart';

/// Clase
class LoadSessionNotifier extends StateNotifier<LoadSessionState> {
  /// Constructor
  LoadSessionNotifier({
    required LoadSessionUC loadSessionUC,
    LoadSessionState? initialState,
  })  : _loadSessionUC = loadSessionUC,
        super(initialState ?? const LoadSessionState.initial());
  final LoadSessionUC _loadSessionUC;

  /// Resetea el estado a inicial
  void reset() => state = const LoadSessionState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> loadSession() async {
    state = const LoadSessionState.loading();
    final result = await _loadSessionUC();
    result.when(
      left: (error) =>
          state = LoadSessionState.error(mapFailureToString(error)),
      right: (response) => state = LoadSessionState.data(
        user: response,
      ),
    );
  }
}
