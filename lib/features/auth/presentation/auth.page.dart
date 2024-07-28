import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/phone/signin.view.dart';

import '../../home/home.page.dart';
import 'views/phone/splash.view.dart';

/// Pagina de autenticacion
class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authState = ref.watch(authStateProvider);
    return SignInPhoneView();
    // return authState.when(
    //     data: (user) {
    //       // * (Modificable) HomePage puede ser cambiado a la pagina deseada
    //       if (user != null) return const HomePage();
    //       return const SignInPhoneView();
    //     },
    //     loading: () => const SplashPhoneView(),
    //     error: (e, trace) => const SignInPhoneView());
  }
}
