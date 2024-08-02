import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:prinstom/config/router/list_routes.dart';
// import 'package:prinstom/features/auth/presentation/auth.i18n.dart';

import '../../../../../config/router/list_routes.dart';
import '../../../../../utils/constants/list_currency.dart';
import '../../auth.i18n.dart';
import '../../providers/currency_selected.provider.dart';

class ListCurrencyPhoneView extends ConsumerStatefulWidget {
  const ListCurrencyPhoneView({super.key});

  @override
  ListCurrencyPhoneViewState createState() => ListCurrencyPhoneViewState();
}

class ListCurrencyPhoneViewState extends ConsumerState<ListCurrencyPhoneView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: Alignment.centerLeft,
                child: TextH3(
                  text: kTitleListCurrency.i18n,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: IconButton(
                      onPressed: () {
                        ref.read(appRouterProvider).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SliverList.builder(
              itemCount: listCurrency.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    ref.read(currencySelectedProvider.notifier).update(
                          (state) => listCurrency[index],
                        );
                    ref.read(appRouterProvider).pop();
                  },
                  title: TextH4(
                    text: listCurrency[index].description,
                  ),
                  subtitle: TextB1(
                    text: listCurrency[index].shortDescription,
                  ),
                  trailing: TextH4(
                    text: listCurrency[index].simbol,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
