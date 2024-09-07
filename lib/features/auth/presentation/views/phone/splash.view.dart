import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/router/list_routes.dart';
import '../../../../home/presentation/providers/injects_container.provider.dart';
import '../../providers/injects_container.provider.dart';
import '../../providers/user_active.provider.dart';

/// Vista Splash para telefonos
class SplashPhoneView extends ConsumerWidget {
  const SplashPhoneView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadSession = ref.watch(loadSessionNotifierProvider);
    ref.listen(
      loadSessionNotifierProvider.select((value) => value),
      (previous, next) {
        next.whenOrNull(
          data: (user) {
            ref.read(userActiveProvider.notifier).state = user;
            ref
                .read(loadFirstAccountByUserIdNotifierProvider.notifier)
                .loadFirstAccountByUserId(user.id!);
            ref.read(appRouterProvider).pushNamed('home');
          },
          error: (message) {
            ref.read(appRouterProvider).pushNamed('signin');
          },
        );
      },
    );
    return Scaffold(
      body: Center(
          child: loadSession.maybeWhen(
        orElse: () => Text('Cargando'),
      )),
    );
  }
}
