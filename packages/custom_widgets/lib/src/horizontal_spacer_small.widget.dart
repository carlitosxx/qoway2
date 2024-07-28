import 'package:flutter/material.dart';

/// Widget para espaciar en horizontal de tamaño pequeño
class HorizontalSpacerSmall extends StatelessWidget {
  /// constructor
  const HorizontalSpacerSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 8,
    );
  }
}
