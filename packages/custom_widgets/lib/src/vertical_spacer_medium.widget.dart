import 'package:flutter/material.dart';

/// Widget para espaciar en vertical de tamaño mediano
class VerticalSpacerMedium extends StatelessWidget {
  /// Este widget te permite realizar un espaciado de tamaño medio
  /// en direccion vertical
  const VerticalSpacerMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}
