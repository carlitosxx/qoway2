import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/features/home/presentation/providers/injects_container.provider.dart';
import 'package:prinstom/features/home/presentation/widgets/my_appbar.widget.dart';

import '../../widgets/my_drawer.widget.dart';
import '../../widgets/my_navigation_bar.widget.dart';

class HomePhoneView extends ConsumerStatefulWidget {
  const HomePhoneView({super.key});

  @override
  HomePhoneViewState createState() => HomePhoneViewState();
}

class HomePhoneViewState extends ConsumerState<HomePhoneView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: CustomScrollView(
        slivers: [
          const MyAppBar(),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Text('asdasd');
            },
            itemCount: 100000,
          )
        ],
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
