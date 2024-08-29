import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../injects_container.provider.dart';

final providerContainer = ProviderContainer();
// final providerContainer2 = ProviderContainer();
// final providerContainer3 = ProviderContainer();
final accountIdProvider = StateProvider<int?>((ref) => null);
int? getCurrentAccountId() {
  return providerContainer.read(accountIdProvider);
}

void setCurrentAccountId(int accountId, int userId) {
  // providerContainer.read()
  //  final user = providerContainer.watch(userActiveProvider);
  // providerContainer2
  //     .read(loadListExpensesNotifierProvider.notifier)
  //     .loadListExpenses(userId, accountId);
  // providerContainer3
  //     .read(loadListIncomesNotifierProvider.notifier)
  //     .loadListIncomes(userId, accountId);
  providerContainer.read(accountIdProvider.notifier).state = accountId;
}
