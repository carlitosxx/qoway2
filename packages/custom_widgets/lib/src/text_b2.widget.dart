import 'package:flutter/material.dart';

/// Texto de cuerpo
class TextB2 extends StatelessWidget {
  /// Constructor
  const TextB2({
    required this.text,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.fontSize,
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

  /// propiedad de tamaño del texto
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color:
              color ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          fontWeight: fontWeight,
          fontSize: fontSize ?? 11,
        );
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
