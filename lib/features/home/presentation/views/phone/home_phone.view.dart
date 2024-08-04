import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/features/home/presentation/providers/injects_container.provider.dart';

import '../../widgets/my_navigation_bar.widget.dart';

class HomePhoneView extends ConsumerStatefulWidget {
  const HomePhoneView({super.key});

  @override
  HomePhoneViewState createState() => HomePhoneViewState();
}

class HomePhoneViewState extends ConsumerState<HomePhoneView> {
  @override
  Widget build(BuildContext context) {
    final stateAccount = ref.watch(loadFirstAccountByUserIdNotifierProvider);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: stateAccount.maybeWhen(
            orElse: () => const Text('0'),
            data: (account) => TextB1(text: account.description),
            loading: () => const CircularProgressIndicator(),
          )
          // Text('asdasd'),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
