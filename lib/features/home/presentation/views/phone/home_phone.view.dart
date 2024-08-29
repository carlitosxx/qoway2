import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/config/router/list_routes.dart';
import 'package:prinstom/features/home/presentation/views/phone/transactions.view.dart';

import 'package:prinstom/features/home/presentation/widgets/my_appbar.widget.dart';

import '../../providers/selected_button.provider.dart';
import '../../widgets/my_drawer.widget.dart';
import '../../widgets/my_navigation_bar.widget.dart';

class HomePhoneView extends ConsumerStatefulWidget {
  const HomePhoneView({super.key});

  @override
  HomePhoneViewState createState() => HomePhoneViewState();
}

class HomePhoneViewState extends ConsumerState<HomePhoneView> {
  int screnIndex = 0;
  List screens = [
    const TransactionsPhoneView(isIncome: true),
    const TransactionsPhoneView(isIncome: false),
  ];
  @override
  Widget build(BuildContext context) {
    final isIncomeSelected = ref.watch(isIncomeSelectedProvider);

    return Scaffold(
      drawer: const MyDrawer(),
      body: CustomScrollView(
        slivers: [const MyAppBar(), screens[isIncomeSelected ? 0 : 1]],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(appRouterProvider).pushNamed('add_transaction');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
