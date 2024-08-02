import 'package:flutter/material.dart';

/// Custom Painter del candado
class PadlockCP extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path0 = Path()
      ..moveTo(size.width * 0.8947368, size.height * 0.2495652)
      ..lineTo(size.width * 0.8947368, size.height * 0.4565217)
      ..lineTo(size.width * 0.7442105, size.height * 0.4565217)
      ..lineTo(size.width * 0.7442105, size.height * 0.3226087)
      ..cubicTo(
        size.width * 0.7442105,
        size.height * 0.2995652,
        size.width * 0.7394737,
        size.height * 0.2782609,
        size.width * 0.7300000,
        size.height * 0.2582609,
      )
      ..cubicTo(
        size.width * 0.6968421,
        size.height * 0.1839130,
        size.width * 0.6063158,
        size.height * 0.1304348,
        size.width * 0.5000000,
        size.height * 0.1304348,
      )
      ..cubicTo(
        size.width * 0.3936842,
        size.height * 0.1304348,
        size.width * 0.3031579,
        size.height * 0.1839130,
        size.width * 0.2700000,
        size.height * 0.2582609,
      )
      ..cubicTo(
        size.width * 0.2605263,
        size.height * 0.2782609,
        size.width * 0.2557895,
        size.height * 0.2995652,
        size.width * 0.2557895,
        size.height * 0.3226087,
      )
      ..lineTo(size.width * 0.2557895, size.height * 0.4565217)
      ..lineTo(size.width * 0.1052632, size.height * 0.4565217)
      ..lineTo(size.width * 0.1052632, size.height * 0.2495652)
      ..cubicTo(
        size.width * 0.1052632,
        size.height * 0.2200000,
        size.width * 0.1131579,
        size.height * 0.1921739,
        size.width * 0.1284211,
        size.height * 0.1660870,
      )
      ..cubicTo(
        size.width * 0.1821053,
        size.height * 0.06956522,
        size.width * 0.3284211,
        0,
        size.width * 0.5000000,
        0,
      )
      ..cubicTo(
        size.width * 0.6715789,
        0,
        size.width * 0.8178947,
        size.height * 0.06956522,
        size.width * 0.8715789,
        size.height * 0.1660870,
      )
      ..cubicTo(
        size.width * 0.8868421,
        size.height * 0.1921739,
        size.width * 0.8947368,
        size.height * 0.2200000,
        size.width * 0.8947368,
        size.height * 0.2495652,
      )
      ..close();

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xfff4f3f4);
    canvas.drawPath(path0, paint0Fill);

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff458282);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.1578947,
        size.height * 0.4565217,
        size.width * 0.6842105,
        size.height * 0.5434783,
      ),
      paint1Fill,
    );

    final path2 = Path()
      ..moveTo(size.width * 0.8421053, size.height * 0.4565217)
      ..lineTo(size.width, size.height * 0.4565217)
      ..lineTo(size.width, size.height * 0.9565217)
      ..cubicTo(
        size.width,
        size.height * 0.9804348,
        size.width * 0.9763158,
        size.height,
        size.width * 0.9473684,
        size.height,
      )
      ..lineTo(size.width * 0.8421053, size.height)
      ..lineTo(size.width * 0.8421053, size.height * 0.4565217)
      ..lineTo(size.width * 0.8421053, size.height * 0.4565217)
      ..close();

    final paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff386969);
    canvas.drawPath(path2, paint2Fill);

    final path3 = Path()
      ..moveTo(0, size.height * 0.4565217)
      ..lineTo(size.width * 0.1578947, size.height * 0.4565217)
      ..lineTo(size.width * 0.1578947, size.height)
      ..lineTo(size.width * 0.05263158, size.height)
      ..cubicTo(
        size.width * 0.02368421,
        size.height,
        0,
        size.height * 0.9804348,
        0,
        size.height * 0.9565217,
      )
      ..lineTo(0, size.height * 0.4565217)
      ..lineTo(0, size.height * 0.4565217)
      ..close();

    final paint3Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff549d9d);
    canvas.drawPath(path3, paint3Fill);

    final paint4Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff485358);
    canvas.drawCircle(
      Offset(size.width * 0.5000000, size.height * 0.6739130),
      size.width * 0.07894737,
      paint4Fill,
    );

    final path5 = Path()
      ..moveTo(size.width * 0.5000000, size.height * 0.6956522)
      ..lineTo(size.width * 0.5000000, size.height * 0.6956522)
      ..lineTo(size.width * 0.4473684, size.height * 0.8260870)
      ..lineTo(size.width * 0.5526316, size.height * 0.8260870)
      ..lineTo(size.width * 0.5000000, size.height * 0.6956522)
      ..close();

    final paint5Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff485358);
    canvas.drawPath(path5, paint5Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
