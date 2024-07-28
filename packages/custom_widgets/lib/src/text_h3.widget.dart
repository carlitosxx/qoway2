import 'package:flutter/material.dart';

/// Widget de texto cabecera v1
class TextH3 extends StatelessWidget {
  /// constructor
  const TextH3({
    required this.text,
    this.color,
    this.fontWeight,
    super.key,
  });

  /// Propiedad texto
  final String text;

  /// Propiedad color
  final Color? color;

  /// Propiedad negrita
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? Theme.of(context).colorScheme.onSurface,
        );
    return Text(
      text,
      style: textStyle,
    );
  }
}
