import 'package:flutter/material.dart';

/// Clase de animacion de opacidad
class OpacityAnimation extends StatelessWidget {
  /// Constructor
  const OpacityAnimation({
    required this.child,
    required this.duration,
    this.curve = Curves.easeInOutQuint,
    super.key,
  });

  /// Propiedad hijo del widget a animar
  final Widget child;

  /// Propiedad duracion de la animacion
  final int duration;

  /// Propiedad de curva de la animacion
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      curve: curve,
      duration: Duration(milliseconds: duration),
      builder: (context, value, child) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: duration),
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}
