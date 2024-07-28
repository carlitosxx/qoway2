import 'package:flutter/material.dart';

/// Animacion de slide para el ingreso de los widgets
class SlideAnimation extends StatelessWidget {
  /// Constructor
  const SlideAnimation({
    required this.offsetStart,
    required this.child,
    required this.duration,
    this.curve = Curves.easeInOutQuint,
    super.key,
  });

  /// Desde donde empezara en offset(X,Y)
  final Offset offsetStart;

  /// El widget que contendra
  final Widget child;

  /// Duracion de la animacion
  final int duration;

  /// Tipo de efecto curvo
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      curve: curve,
      duration: Duration(milliseconds: duration),
      builder: (context, value, child) => AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: value,
        child: child,
      ),
      child: TweenAnimationBuilder(
        curve: curve,
        duration: Duration(milliseconds: duration),
        tween: Tween<Offset>(
          begin: offsetStart,
          end: Offset.zero,
        ),
        builder: (context, newOffset, child) {
          return Transform.translate(
            offset: newOffset,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
