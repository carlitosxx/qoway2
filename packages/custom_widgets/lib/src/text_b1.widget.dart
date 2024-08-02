import 'package:flutter/material.dart';

/// Texto de cuerpo
class TextB1 extends StatelessWidget {
  /// Constructor
  const TextB1({
    required this.text,
    this.color,
    this.fontWeight,
    this.textAlign,
    super.key,
  });

  /// propiedad de texto
  final String text;

  /// propiedad de color
  final Color? color;

  /// propiedad de negrita
  final FontWeight? fontWeight;

  /// propiedad de alineacion
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color:
              color ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          fontWeight: fontWeight,

          // fontSize: 16,
        );
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
