import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prinstom/features/auth/presentation/views/phone/splash.view.dart';
// import 'views/phone/signin.view.dart';

/// Pagina de autenticacion
class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SplashPhoneView();
  }
}
