import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionsPhoneView extends ConsumerStatefulWidget {
  final bool isIncome;
  const TransactionsPhoneView({required this.isIncome, super.key});

  @override
  TransactionsPhoneViewState createState() => TransactionsPhoneViewState();
}

class TransactionsPhoneViewState extends ConsumerState<TransactionsPhoneView> {
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 70,
                fit: FlexFit.loose,
                child: Row(
                  children: [
                    Flexible(
                      flex: 20,
                      fit: FlexFit.loose,
                      child: Column(
                        children: [
                          TextB2(
                            text:
                                // shortMonth(
                                //   cuenta.movimientos[index].fecha,
                                //   context,
                                // )
                                'ENE',
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: TextB2(
                              text:
                                  // dayOfMonth(
                                  //   cuenta.movimientos[index].fecha,
                                  // )
                                  '12',
                              color: Theme.of(context).colorScheme.surface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   width: 7,
                    // ),
                    Flexible(
                      flex: 180,
                      // fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'cuentaasd  asdasd asdasdss sssss',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                              // overflow: TextOverflow.fade,
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
                        text: '10000000.5',
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
