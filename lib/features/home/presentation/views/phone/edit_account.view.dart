import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/config/router/list_routes.dart';

import '../../../../../utils/modals/custom_modal.widget.dart';
import '../../../../auth/domain/entities/account.entity.dart';
import '../../home.i18n.dart';
import '../../providers/injects_container.provider.dart';
import '../../providers/selected_tile_account.provider.dart';
import '../../providers/selected_tile_index.provider.dart';

class EditAccountPhoneView extends ConsumerStatefulWidget {
  const EditAccountPhoneView({
    required this.userId,
    required this.account,
    super.key,
  });
  final int userId;
  final Account account;

  @override
  EditAccountPhoneViewState createState() => EditAccountPhoneViewState();
}

class EditAccountPhoneViewState extends ConsumerState<EditAccountPhoneView> {
  TextEditingController editDescription = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    editDescription.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final editAccountState = ref.watch(editAccountNotifierProvider);
    ref.listen(
      editAccountNotifierProvider.select((value) => value),
      (previous, next) {
        next.whenOrNull(
          error: (message) {
            customModal(context, message, kClose.i18n);
          },
          data: (account) {
            ref
                .read(loadListAccountsByUserIdNotifierProvider.notifier)
                .loadListAccountsByUserId(widget.userId);
            ref.read(tileAccountSelectedProvider.notifier).update(
                  (state) => false,
                );
            ref.read(selectedTileIndexProvider.notifier).update(
                  (state) => null,
                );
            ref.read(appRouterProvider).pop();
          },
        );
      },
    );
    return PopScope(
      onPopInvoked: (didPop) {
        ref.read(tileAccountSelectedProvider.notifier).update(
              (state) => false,
            );
        ref.read(selectedTileIndexProvider.notifier).update(
              (state) => null,
            );
      },
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: TextH4(text: kEditDescription.i18n),
        ),
        bottomNavigationBar: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    child: TextfieldName(
                  hint: kHintEnterYourDescription.i18n,
                  controller: editDescription,
                  icon: Icons.account_balance,
                  focus: _focusNode,
                )),
                const HorizontalSpacerSmall(),
                SizedBox(
                  width: kMinInteractiveDimension,
                  height: kMinInteractiveDimension,
                  child: editAccountState.maybeWhen(
                    orElse: () => MaterialButton(
                      elevation: 0,
                      padding: EdgeInsets.zero, // Sin padding
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: const CircleBorder(),
                      onPressed: () {
                        ref
                            .read(editAccountNotifierProvider.notifier)
                            .editAccount(
                                widget.account
                                  ..description = editDescription.text,
                                widget.userId);
                      },
                      child: const Icon(Icons.check),
                    ),
                    loading: () => MaterialButton(
                      elevation: 0,
                      padding: EdgeInsets.zero, // Sin padding
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: const CircleBorder(),
                      onPressed: null,
                      child: const Icon(Icons.check),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
