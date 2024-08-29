import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/capitalize_first_letter.util.dart';
import '../../../../auth/domain/entities/transaction.entity.dart';
import '../../providers/injects_container.provider.dart';

class TransactionsPhoneView extends ConsumerStatefulWidget {
  final bool isIncome;
  const TransactionsPhoneView({required this.isIncome, super.key});

  @override
  TransactionsPhoneViewState createState() => TransactionsPhoneViewState();
}

class TransactionsPhoneViewState extends ConsumerState<TransactionsPhoneView> {
  @override
  Widget build(BuildContext context) {
    final accountState =
        ref.watch(loadAccountByUserIdAndAccountIdNotifierProvider);
    final accountFirstState =
        ref.watch(loadFirstAccountByUserIdNotifierProvider);

    if (widget.isIncome) {
      return accountState.maybeWhen(
          orElse: () => accountFirstState.maybeWhen(
                orElse: () => const SliverToBoxAdapter(),
                data: (account) => ListTransactions(
                  listTransaction: account.incomes,
                ),
              ),
          data: (account) => ListTransactions(
                listTransaction: account.incomes,
              ));
    } else {
      return accountState.maybeWhen(
          orElse: () => accountFirstState.maybeWhen(
                orElse: () => const SliverToBoxAdapter(),
                data: (account) => ListTransactions(
                  listTransaction: account.expenses,
                ),
              ),
          data: (account) => ListTransactions(
                listTransaction: account.expenses,
              ));
    }
  }
}

class ListTransactions extends StatelessWidget {
  const ListTransactions({super.key, required this.listTransaction});
  final List<Transaction> listTransaction;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: listTransaction.length,
      itemBuilder: (context, index) => GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
            top: 10,
            bottom: 10,
          ),
          margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 70,
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 20,
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextB2(
                            text: capitalizeFirstLetter(DateFormat(
                                    'MMM',
                                    Localizations.localeOf(context)
                                        .languageCode)
                                .format(listTransaction[index].date)),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(3, 2, 3, 1),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: TextB2(
                              text: listTransaction[index]
                                  .date
                                  .day
                                  .toString()
                                  .padLeft(2, '0'),
                              color: Theme.of(context).colorScheme.surface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              listTransaction[index].description,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 30,
                fit: FlexFit.tight,
                child: RichText(
                  text: TextSpan(
                    text: 'S/ ', //! OJO CAMBIAR AL SIMBOLO
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    children: [
                      TextSpan(
                        text: listTransaction[index].amount.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
