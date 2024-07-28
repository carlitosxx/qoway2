import 'package:flutter/material.dart';

/// Widget para espaciar en vertical de tamaño pequeño
class VerticalSpacerSmall extends StatelessWidget {
  /// constructor
  const VerticalSpacerSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 8,
    );
  }
}
