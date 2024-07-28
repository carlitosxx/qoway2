import 'package:flutter/material.dart';

/// Vista Splash para telefonos
class SplashPhoneView extends StatefulWidget {
  const SplashPhoneView({super.key});

  @override
  State<SplashPhoneView> createState() => _SplashPhoneViewState();
}

class _SplashPhoneViewState extends State<SplashPhoneView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'splash',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
