import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/config/router/list_routes.dart';
import 'package:prinstom/features/home/presentation/providers/injects_container.provider.dart';

import '../../../../auth/presentation/providers/user_active.provider.dart';
import '../../home.i18n.dart';

class ListAccountsPhoneView extends ConsumerWidget {
  const ListAccountsPhoneView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsState = ref.watch(loadListAccountsByUserIdNotifierProvider);
    final user = ref.watch(userActiveProvider);
    return Scaffold(
      appBar: AppBar(
        title: TextH4(text: kListAccounts.i18n),
      ),
      body: CustomScrollView(
        slivers: [
          accountsState.maybeWhen(
            orElse: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            data: (account) => SliverList.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    onTap: () {
                      ref
                          .read(loadAccountByUserIdAndAccountIdNotifierProvider
                              .notifier)
                          .loadAccountByUserIdAndAccountId(
                              user!.id!, account[index].id);
                      ref.read(appRouterProvider).pop();
                    },
                    title: TextB1(
                      text: account[index].description,
                    ),
                  ),
                  if (index < account.length - 1) const Divider(),
                ],
              ),
              itemCount: account.length,
            ),
          )
        ],
      ),
    );
  }
}
