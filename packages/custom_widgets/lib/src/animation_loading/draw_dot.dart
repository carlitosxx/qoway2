import 'package:flutter/material.dart';

/// Widget dibujar punto
class DrawDot extends StatelessWidget {
  /// Contructor nombrado eliptical
  const DrawDot.elliptical({
    required this.width,
    required this.height,
    required this.color,
    super.key,
  }) : circular = false;

  /// contructor nombrado circular
  const DrawDot.circular({
    required double dotSize,
    required this.color,
    super.key,
  })  : width = dotSize,
        height = dotSize,
        circular = true;

  /// ancho
  final double width;

  /// alto
  final double height;

  /// es circular?
  final bool circular;

  /// Color
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: circular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circular
            ? null
            : BorderRadius.all(Radius.elliptical(width, height)),
      ),
    );
  }
}
