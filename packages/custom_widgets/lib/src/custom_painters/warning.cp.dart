import 'package:flutter/widgets.dart';

/// Custom Painter para el error de Advertencia
class WarningCP extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.5002672, 0)
      ..cubicTo(
        size.width * 0.4740780,
        0,
        size.width * 0.4478888,
        size.height * 0.01446655,
        size.width * 0.4329236,
        size.height * 0.04400241,
      )
      ..lineTo(
        size.width * 0.01068947,
        size.height * 0.8685955,
      )
      ..cubicTo(
        size.width * -0.01924105,
        size.height * 0.9270645,
        size.width * 0.01817210,
        size.height,
        size.width * 0.07803314,
        size.height,
      )
      ..lineTo(
        size.width * 0.5002672,
        size.height,
      )
      ..lineTo(
        size.width * 0.5002672,
        0,
      )
      ..close();

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff549d9d);
    canvas.drawPath(path_0, paint0Fill);

    final path_1 = Path()
      ..moveTo(size.width * 0.5002672, 0)
      ..cubicTo(
        size.width * 0.5264564,
        0,
        size.width * 0.5526456,
        size.height * 0.01446655,
        size.width * 0.5676109,
        size.height * 0.04400241,
      )
      ..lineTo(
        size.width * 0.9898450,
        size.height * 0.8691983,
      )
      ..cubicTo(
        size.width * 1.019776,
        size.height * 0.9276673,
        size.width * 0.9823624,
        size.height * 1.000603,
        size.width * 0.9225013,
        size.height * 1.000603,
      )
      ..lineTo(
        size.width * 0.5002672,
        size.height * 1.000603,
      )
      ..lineTo(
        size.width * 0.5002672,
        0,
      )
      ..close();

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff458282);
    canvas.drawPath(path_1, paint1Fill);

    final paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xfff4f3f4);
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(
          size.width * 0.4580438,
          size.height * 0.2561784,
          size.width * 0.08391235,
          size.height * 0.4906570,
        ),
        bottomRight: Radius.circular(size.width * 0.04222341),
        bottomLeft: Radius.circular(size.width * 0.04222341),
        topLeft: Radius.circular(size.width * 0.04222341),
        topRight: Radius.circular(size.width * 0.04222341),
      ),
      paint2Fill,
    );

    final paint3Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xfff4f3f4);
    canvas.drawCircle(
      Offset(size.width * 0.5002672, size.height * 0.8758288),
      size.width * 0.05130946,
      paint3Fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
