import 'package:flutter/rendering.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*0.8872260823089257).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

/// custom painter del logo de Perú
class PeCP extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.1133084, size.height * 0.5000000)
      ..cubicTo(
        size.width * 0.1133084,
        size.height * 0.7006024,
        size.width * 0.2335649,
        size.height * 0.8686747,
        size.width * 0.3971138,
        size.height * 0.9198795,
      )
      ..lineTo(size.width * 0.3971138, size.height * 0.08012048)
      ..cubicTo(
        size.width * 0.2335649,
        size.height * 0.1313253,
        size.width * 0.1133084,
        size.height * 0.2993976,
        size.width * 0.1133084,
        size.height * 0.5000000,
      )
      ..close();

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xfff21414).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);

    final path_1 = Path()
      ..moveTo(size.width * 0.8866916, size.height * 0.5000000)
      ..cubicTo(
        size.width * 0.8866916,
        size.height * 0.2993976,
        size.width * 0.7664351,
        size.height * 0.1313253,
        size.width * 0.6028862,
        size.height * 0.08012048,
      )
      ..lineTo(size.width * 0.6028862, size.height * 0.9192771)
      ..cubicTo(
        size.width * 0.7664351,
        size.height * 0.8680723,
        size.width * 0.8866916,
        size.height * 0.7000000,
        size.width * 0.8866916,
        size.height * 0.4993976,
      )
      ..close();

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xfff21414).withOpacity(1);
    canvas.drawPath(path_1, paint1Fill);

    final path_2 = Path()
      ..moveTo(size.width * 0.4997328, size.height * 0.06385542)
      ..cubicTo(
        size.width * 0.4639230,
        size.height * 0.06385542,
        size.width * 0.4291823,
        size.height * 0.06987952,
        size.width * 0.3965794,
        size.height * 0.08012048,
      )
      ..lineTo(size.width * 0.3965794, size.height * 0.9192771)
      ..cubicTo(
        size.width * 0.4297167,
        size.height * 0.9295181,
        size.width * 0.4639230,
        size.height * 0.9355422,
        size.width * 0.4997328,
        size.height * 0.9355422,
      )
      ..cubicTo(
        size.width * 0.5355425,
        size.height * 0.9355422,
        size.width * 0.5702833,
        size.height * 0.9295181,
        size.width * 0.6028862,
        size.height * 0.9192771,
      )
      ..lineTo(
        size.width * 0.6028862,
        size.height * 0.08012048,
      )
      ..cubicTo(
        size.width * 0.5697488,
        size.height * 0.06987952,
        size.width * 0.5355425,
        size.height * 0.06385542,
        size.width * 0.4997328,
        size.height * 0.06385542,
      )
      ..close();

    final paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffffffff).withOpacity(1);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
