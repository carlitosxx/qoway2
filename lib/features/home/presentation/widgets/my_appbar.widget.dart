import 'dart:io';

import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/config/router/list_routes.dart';

import '../../../auth/presentation/providers/user_active.provider.dart';
import '../providers/injects_container.provider.dart';

/// AppBar personalizado
class MyAppBar extends ConsumerStatefulWidget {
  /// AppBar personalizado
  const MyAppBar({
    super.key,
  });

  @override
  MyAppBarState createState() => MyAppBarState();
}

/// estado del widget
class MyAppBarState extends ConsumerState<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    double spaceExtraAndroid = 0;
    if (Platform.isAndroid) {
      spaceExtraAndroid = 15;
    }
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: PersistentHeaderDelegate(
        maxExtend: const Size.fromHeight(kToolbarHeight).height * 3 -
            spaceExtraAndroid,
        minExtend: MediaQuery.of(context).padding.top + kToolbarHeight,
        ref: ref,
      ),
    );
  }
}

/// esto es un header persistente personalizable
class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  /// esto es un header persistente personalizable
  PersistentHeaderDelegate({
    required this.maxExtend,
    required this.minExtend,
    required this.ref,
  });

  /// WidgetRef
  final WidgetRef ref;

  /// Maximo de extension del header
  final double maxExtend;

  /// Minimo de extension del header
  final double minExtend;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final newValue = maxExtend - shrinkOffset;
    final delta = newValue / maxExtend;
    // final teta = shrinkOffset / maxExtend;
    final ancho = MediaQuery.of(context).size.width;
    final user = ref.watch(userActiveProvider);
    final stateAccount = ref.watch(loadFirstAccountByUserIdNotifierProvider);
    final stateAccountRefresh =
        ref.watch(loadAccountByUserIdAndAccountIdNotifierProvider);
    // var b = 0.0;
    // var c = 0.0;

    // if (delta < 0.5) {
    //   b = 0;
    //   c = (teta - 0.5) / 0.5;
    // } else {
    //   c = 0;
    //   b = (delta - 0.5) / 0.5;
    // }
    // var d = 0.0;
    // d = (1 - teta) * 100 + (1 - teta) * 35 + teta * 50;
    // print(delta);

    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(delta * 30),
            bottomLeft: Radius.circular(delta * 30),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).padding.top + (kToolbarHeight / 3),
              left: 0,
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: SizedBox(
                  width: ancho * 0.15,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: minExtend,
                            child: const Icon(Icons.menu),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 5,
              left: 4,
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            ),
            // Caja opaca de la barra de status
            Positioned(
              top: 0,
              child: Container(
                height: MediaQuery.of(context).padding.top,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            // Texto Principal
            Positioned(
              top: MediaQuery.of(context).padding.top + (kToolbarHeight / 3),
              child: GestureDetector(
                onTap: () {},
                child: stateAccount.maybeWhen(
                  orElse: () => const Text('0'),
                  data: (account) => stateAccountRefresh.maybeWhen(
                    orElse: () => GestureDetector(
                      onTap: () {
                        ref
                            .read(loadListAccountsByUserIdNotifierProvider
                                .notifier)
                            .loadListAccountsByUserId(user!.id!);
                        ref.read(appRouterProvider).pushNamed('list_accounts');
                      },
                      child: Row(
                        children: [
                          TextH4(text: account.description),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    loading: () => const CircularProgressIndicator(),
                    data: (account) => TextH4(text: account.description),
                  ),
                  loading: () => const CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxExtend;

  @override
  double get minExtent => minExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
