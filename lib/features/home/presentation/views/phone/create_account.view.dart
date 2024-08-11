import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/config/router/list_routes.dart';
import 'package:prinstom/features/auth/domain/entities/account.entity.dart';
import 'package:prinstom/features/home/presentation/providers/injects_container.provider.dart';

import '../../../../../utils/modals/custom_modal.widget.dart';
import '../../../../auth/presentation/providers/user_active.provider.dart';
import '../../home.i18n.dart';
import '../../providers/selected_tile_account.provider.dart';
import '../../providers/selected_tile_index.provider.dart';

class CreateAccountPhoneView extends ConsumerStatefulWidget {
  const CreateAccountPhoneView({super.key});

  @override
  CreateAccountPhoneViewState createState() => CreateAccountPhoneViewState();
}

class CreateAccountPhoneViewState
    extends ConsumerState<CreateAccountPhoneView> {
  TextEditingController accountController = TextEditingController();
  // int? _selectedTileIndex;
  late Account _accountSelected;
  @override
  void dispose() {
    accountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userActiveProvider);
    final selectedTileIndex = ref.watch(selectedTileIndexProvider);
    final selectedTileAccount = ref.watch(tileAccountSelectedProvider);
    final createAccountState = ref.watch(createAccountNotifierProvider);
    final stateListAccounts =
        ref.watch(loadListAccountsByUserIdNotifierProvider);
    ref.listen(
      createAccountNotifierProvider.select((value) => value),
      (previous, next) {
        next.whenOrNull(
          error: (message) {
            customModal(context, message, kClose.i18n);
          },
          data: (account) {
            ref
                .read(loadListAccountsByUserIdNotifierProvider.notifier)
                .loadListAccountsByUserId(user!.id!);
          },
        );
      },
    );
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          Navigator.of(context).pop();
        }
      },
      behavior: HitTestBehavior.translucent,
      onTap: () {
        primaryFocus?.unfocus();
        ref.read(tileAccountSelectedProvider.notifier).update(
              (state) => false,
            );
        ref.read(selectedTileIndexProvider.notifier).update(
              (state) => null,
            );
        // accountSelected = null;
        // setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          title: selectedTileAccount
              ? SizedBox.fromSize()
              : TextH4(text: kCreateAccount.i18n),
          actions: selectedTileAccount
              ? [
                  IconButton(
                    onPressed: () {
                      ref
                          .read(appRouterProvider)
                          .pushNamed('edit_account', extra: {
                        'account': _accountSelected,
                        'userId': user!.id,
                      });
                    },
                    icon: const Icon(Icons.edit_outlined),
                  ),
                  const HorizontalSpacerSmall()
                ]
              : [],
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: VerticalSpacerMedium(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextfieldName(
                  hint: kHintEnterYourDescription.i18n,
                  controller: accountController,
                  icon: Icons.account_balance,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: VerticalSpacerLarge(),
            ),
            SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                sliver: stateListAccounts.maybeWhen(
                  orElse: () => const SliverToBoxAdapter(
                    child: Text('orElse'),
                  ),
                  loading: () => const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  data: (accounts) => SliverList.builder(
                    itemCount: accounts.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedTileIndex == index
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer
                                  .withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onLongPress: () {
                              _accountSelected = accounts[index];
                              ref
                                  .read(selectedTileIndexProvider.notifier)
                                  .update(
                                    (state) => index,
                                  );
                              // selectedTileIndex = index;
                              ref
                                  .read(tileAccountSelectedProvider.notifier)
                                  .update(
                                    (state) => true,
                                  );
                            },
                            child: ListTile(
                              // trailing: const Icon(Icons.edit),
                              title: TextH4(text: accounts[index].description),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          width: double.infinity,
          child: createAccountState.maybeWhen(
            orElse: () => ButtonV1(
              onPressed: () {
                ref
                    .read(createAccountNotifierProvider.notifier)
                    .createAccount(accountController.text.trim(), user!.id!);
              },
              text: kCreateAccount.i18n,
            ),
            loading: () => const ButtonV1Loading(),
          ),
        ),
      ),
    );
  }
}
