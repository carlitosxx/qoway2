import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerContainer = ProviderContainer();
final accountIdProvider = StateProvider<int?>((ref) => null);
int? getCurrentAccountId() {
  return providerContainer.read(accountIdProvider);
}

void setCurrentAccountId(int accountId) {
  providerContainer.read(accountIdProvider.notifier).state = accountId;
}
