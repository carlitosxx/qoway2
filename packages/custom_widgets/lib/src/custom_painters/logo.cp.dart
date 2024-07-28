import 'package:flutter/widgets.dart';

/// Dibujo del logo con CustomPainter
class LogoCP extends CustomPainter {
  /// Constructor
  LogoCP({required this.hasBackground, required this.backgroundColor});

  /// tiene fondo?
  final bool hasBackground;

  /// color
  final Color backgroundColor;
  @override
  void paint(Canvas canvas, Size size) {
    final path0 = Path()
      ..moveTo(0, size.height * 0.5000000)
      ..lineTo(0, size.height * 0.5000000)
      ..cubicTo(
        0,
        size.height * 0.2238462,
        size.width * 0.2238462,
        0,
        size.width * 0.5000000,
        0,
      )
      ..lineTo(size.width * 0.5000000, 0)
      ..cubicTo(
        size.width * 0.7761538,
        0,
        size.width,
        size.height * 0.2238462,
        size.width,
        size.height * 0.5000000,
      )
      ..lineTo(size.width, size.height * 0.5000000)
      ..cubicTo(
        size.width,
        size.height * 0.7761538,
        size.width * 0.7761538,
        size.height,
        size.width * 0.5000000,
        size.height,
      )
      ..lineTo(size.width * 0.5000000, size.height)
      ..cubicTo(
        size.width * 0.2238462,
        size.height,
        0,
        size.height * 0.7761538,
        0,
        size.height * 0.5000000,
      )
      ..close();
    if (hasBackground) {
      final paint0Fill = Paint()
        ..style = PaintingStyle.fill
        ..color = backgroundColor;

      canvas.drawPath(path0, paint0Fill);
    }

    final path1 = Path()
      ..moveTo(size.width * 0.5023077, size.height * 0.3715385)
      ..cubicTo(
        size.width * 0.5184615,
        size.height * 0.3715385,
        size.width * 0.5326923,
        size.height * 0.3734615,
        size.width * 0.5453846,
        size.height * 0.3776923,
      )
      ..cubicTo(
        size.width * 0.5580769,
        size.height * 0.3819231,
        size.width * 0.5692308,
        size.height * 0.3869231,
        size.width * 0.5788462,
        size.height * 0.3938462,
      )
      ..cubicTo(
        size.width * 0.5884615,
        size.height * 0.4003846,
        size.width * 0.5965385,
        size.height * 0.4080769,
        size.width * 0.6034615,
        size.height * 0.4169231,
      )
      ..cubicTo(
        size.width * 0.6103846,
        size.height * 0.4257692,
        size.width * 0.6157692,
        size.height * 0.4350000,
        size.width * 0.6200000,
        size.height * 0.4446154,
      )
      ..cubicTo(
        size.width * 0.6242308,
        size.height * 0.4542308,
        size.width * 0.6273077,
        size.height * 0.4638462,
        size.width * 0.6296154,
        size.height * 0.4738462,
      )
      ..cubicTo(
        size.width * 0.6315385,
        size.height * 0.4834615,
        size.width * 0.6326923,
        size.height * 0.4930769,
        size.width * 0.6326923,
        size.height * 0.5015385,
      )
      ..lineTo(size.width * 0.6326923, size.height * 0.6688462)
      ..lineTo(size.width * 0.5400000, size.height * 0.6688462)
      ..lineTo(size.width * 0.5400000, size.height * 0.5015385)
      ..cubicTo(
        size.width * 0.5400000,
        size.height * 0.4892308,
        size.width * 0.5369231,
        size.height * 0.4800000,
        size.width * 0.5303846,
        size.height * 0.4738462,
      )
      ..cubicTo(
        size.width * 0.5238462,
        size.height * 0.4676923,
        size.width * 0.5146154,
        size.height * 0.4646154,
        size.width * 0.5026923,
        size.height * 0.4646154,
      )
      ..lineTo(size.width * 0.3776923, size.height * 0.4646154)
      ..cubicTo(
        size.width * 0.3650000,
        size.height * 0.4646154,
        size.width * 0.3553846,
        size.height * 0.4676923,
        size.width * 0.3492308,
        size.height * 0.4742308,
      )
      ..cubicTo(
        size.width * 0.3430769,
        size.height * 0.4803846,
        size.width * 0.3400000,
        size.height * 0.4896154,
        size.width * 0.3400000,
        size.height * 0.5019231,
      )
      ..lineTo(size.width * 0.3400000, size.height * 0.6684615)
      ..cubicTo(
        size.width * 0.3400000,
        size.height * 0.6811538,
        size.width * 0.3430769,
        size.height * 0.6903846,
        size.width * 0.3496154,
        size.height * 0.6969231,
      )
      ..cubicTo(
        size.width * 0.3557692,
        size.height * 0.7034615,
        size.width * 0.3650000,
        size.height * 0.7065385,
        size.width * 0.3773077,
        size.height * 0.7065385,
      )
      ..lineTo(size.width * 0.7538462, size.height * 0.7065385)
      ..lineTo(size.width * 0.7538462, size.height * 0.7992308)
      ..lineTo(size.width * 0.3769231, size.height * 0.7992308)
      ..cubicTo(
        size.width * 0.3611538,
        size.height * 0.7992308,
        size.width * 0.3465385,
        size.height * 0.7973077,
        size.width * 0.3342308,
        size.height * 0.7930769,
      )
      ..cubicTo(
        size.width * 0.3215385,
        size.height * 0.7892308,
        size.width * 0.3103846,
        size.height * 0.7834615,
        size.width * 0.3007692,
        size.height * 0.7769231,
      )
      ..cubicTo(
        size.width * 0.2911538,
        size.height * 0.7700000,
        size.width * 0.2830769,
        size.height * 0.7623077,
        size.width * 0.2761538,
        size.height * 0.7534615,
      )
      ..cubicTo(
        size.width * 0.2692308,
        size.height * 0.7446154,
        size.width * 0.2638462,
        size.height * 0.7353846,
        size.width * 0.2596154,
        size.height * 0.7257692,
      )
      ..cubicTo(
        size.width * 0.2553846,
        size.height * 0.7161538,
        size.width * 0.2523077,
        size.height * 0.7065385,
        size.width * 0.2500000,
        size.height * 0.6965385,
      )
      ..cubicTo(
        size.width * 0.2480769,
        size.height * 0.6865385,
        size.width * 0.2469231,
        size.height * 0.6773077,
        size.width * 0.2469231,
        size.height * 0.6688462,
      )
      ..lineTo(size.width * 0.2469231, size.height * 0.5015385)
      ..cubicTo(
        size.width * 0.2469231,
        size.height * 0.4857692,
        size.width * 0.2488462,
        size.height * 0.4711538,
        size.width * 0.2530769,
        size.height * 0.4588462,
      )
      ..cubicTo(
        size.width * 0.2573077,
        size.height * 0.4461538,
        size.width * 0.2623077,
        size.height * 0.4350000,
        size.width * 0.2692308,
        size.height * 0.4253846,
      )
      ..cubicTo(
        size.width * 0.2757692,
        size.height * 0.4157692,
        size.width * 0.2834615,
        size.height * 0.4076923,
        size.width * 0.2923077,
        size.height * 0.4007692,
      )
      ..cubicTo(
        size.width * 0.3011538,
        size.height * 0.3938462,
        size.width * 0.3103846,
        size.height * 0.3884615,
        size.width * 0.3200000,
        size.height * 0.3842308,
      )
      ..cubicTo(
        size.width * 0.3296154,
        size.height * 0.3800000,
        size.width * 0.3392308,
        size.height * 0.3769231,
        size.width * 0.3492308,
        size.height * 0.3746154,
      )
      ..cubicTo(
        size.width * 0.3588462,
        size.height * 0.3726923,
        size.width * 0.3680769,
        size.height * 0.3715385,
        size.width * 0.3769231,
        size.height * 0.3715385,
      )
      ..lineTo(size.width * 0.5026923, size.height * 0.3715385)
      ..close();

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffffffff);
    canvas.drawPath(path1, paint1Fill);

    final path_2 = Path()
      ..moveTo(size.width * 0.2938462, size.height * 0.2007692)
      ..cubicTo(
        size.width * 0.3003846,
        size.height * 0.2007692,
        size.width * 0.3061538,
        size.height * 0.2019231,
        size.width * 0.3119231,
        size.height * 0.2046154,
      )
      ..cubicTo(
        size.width * 0.3176923,
        size.height * 0.2069231,
        size.width * 0.3223077,
        size.height * 0.2103846,
        size.width * 0.3265385,
        size.height * 0.2146154,
      )
      ..cubicTo(
        size.width * 0.3307692,
        size.height * 0.2188462,
        size.width * 0.3338462,
        size.height * 0.2234615,
        size.width * 0.3365385,
        size.height * 0.2292308,
      )
      ..cubicTo(
        size.width * 0.3388462,
        size.height * 0.2350000,
        size.width * 0.3400000,
        size.height * 0.2407692,
        size.width * 0.3400000,
        size.height * 0.2469231,
      )
      ..cubicTo(
        size.width * 0.3400000,
        size.height * 0.2530769,
        size.width * 0.3388462,
        size.height * 0.2592308,
        size.width * 0.3365385,
        size.height * 0.2650000,
      )
      ..cubicTo(
        size.width * 0.3342308,
        size.height * 0.2707692,
        size.width * 0.3307692,
        size.height * 0.2753846,
        size.width * 0.3265385,
        size.height * 0.2796154,
      )
      ..cubicTo(
        size.width * 0.3223077,
        size.height * 0.2838462,
        size.width * 0.3176923,
        size.height * 0.2869231,
        size.width * 0.3119231,
        size.height * 0.2892308,
      )
      ..cubicTo(
        size.width * 0.3061538,
        size.height * 0.2915385,
        size.width * 0.3003846,
        size.height * 0.2926923,
        size.width * 0.2938462,
        size.height * 0.2926923,
      )
      ..cubicTo(
        size.width * 0.2873077,
        size.height * 0.2926923,
        size.width * 0.2819231,
        size.height * 0.2915385,
        size.width * 0.2761538,
        size.height * 0.2892308,
      )
      ..cubicTo(
        size.width * 0.2703846,
        size.height * 0.2869231,
        size.width * 0.2657692,
        size.height * 0.2834615,
        size.width * 0.2615385,
        size.height * 0.2796154,
      )
      ..cubicTo(
        size.width * 0.2573077,
        size.height * 0.2753846,
        size.width * 0.2542308,
        size.height * 0.2703846,
        size.width * 0.2515385,
        size.height * 0.2650000,
      )
      ..cubicTo(
        size.width * 0.2492308,
        size.height * 0.2592308,
        size.width * 0.2476923,
        size.height * 0.2534615,
        size.width * 0.2476923,
        size.height * 0.2469231,
      )
      ..cubicTo(
        size.width * 0.2476923,
        size.height * 0.2403846,
        size.width * 0.2488462,
        size.height * 0.2350000,
        size.width * 0.2515385,
        size.height * 0.2292308,
      )
      ..cubicTo(
        size.width * 0.2542308,
        size.height * 0.2234615,
        size.width * 0.2573077,
        size.height * 0.2188462,
        size.width * 0.2615385,
        size.height * 0.2146154,
      )
      ..cubicTo(
        size.width * 0.2657692,
        size.height * 0.2103846,
        size.width * 0.2707692,
        size.height * 0.2069231,
        size.width * 0.2761538,
        size.height * 0.2046154,
      )
      ..cubicTo(
        size.width * 0.2819231,
        size.height * 0.2019231,
        size.width * 0.2876923,
        size.height * 0.2007692,
        size.width * 0.2938462,
        size.height * 0.2007692,
      )
      ..close()
      ..moveTo(size.width * 0.5861538, size.height * 0.2007692)
      ..cubicTo(
        size.width * 0.5926923,
        size.height * 0.2007692,
        size.width * 0.5984615,
        size.height * 0.2019231,
        size.width * 0.6042308,
        size.height * 0.2046154,
      )
      ..cubicTo(
        size.width * 0.6100000,
        size.height * 0.2069231,
        size.width * 0.6146154,
        size.height * 0.2103846,
        size.width * 0.6188462,
        size.height * 0.2146154,
      )
      ..cubicTo(
        size.width * 0.6230769,
        size.height * 0.2188462,
        size.width * 0.6261538,
        size.height * 0.2234615,
        size.width * 0.6284615,
        size.height * 0.2292308,
      )
      ..cubicTo(
        size.width * 0.6307692,
        size.height * 0.2350000,
        size.width * 0.6319231,
        size.height * 0.2407692,
        size.width * 0.6319231,
        size.height * 0.2469231,
      )
      ..cubicTo(
        size.width * 0.6319231,
        size.height * 0.2530769,
        size.width * 0.6307692,
        size.height * 0.2592308,
        size.width * 0.6284615,
        size.height * 0.2650000,
      )
      ..cubicTo(
        size.width * 0.6261538,
        size.height * 0.2707692,
        size.width * 0.6226923,
        size.height * 0.2753846,
        size.width * 0.6188462,
        size.height * 0.2796154,
      )
      ..cubicTo(
        size.width * 0.6146154,
        size.height * 0.2838462,
        size.width * 0.6096154,
        size.height * 0.2869231,
        size.width * 0.6042308,
        size.height * 0.2892308,
      )
      ..cubicTo(
        size.width * 0.5988462,
        size.height * 0.2915385,
        size.width * 0.5926923,
        size.height * 0.2926923,
        size.width * 0.5861538,
        size.height * 0.2926923,
      )
      ..cubicTo(
        size.width * 0.5796154,
        size.height * 0.2926923,
        size.width * 0.5742308,
        size.height * 0.2915385,
        size.width * 0.5684615,
        size.height * 0.2892308,
      )
      ..cubicTo(
        size.width * 0.5630769,
        size.height * 0.2869231,
        size.width * 0.5580769,
        size.height * 0.2834615,
        size.width * 0.5538462,
        size.height * 0.2796154,
      )
      ..cubicTo(
        size.width * 0.5496154,
        size.height * 0.2753846,
        size.width * 0.5461538,
        size.height * 0.2703846,
        size.width * 0.5438462,
        size.height * 0.2650000,
      )
      ..cubicTo(
        size.width * 0.5411538,
        size.height * 0.2592308,
        size.width * 0.5400000,
        size.height * 0.2534615,
        size.width * 0.5400000,
        size.height * 0.2469231,
      )
      ..cubicTo(
        size.width * 0.5400000,
        size.height * 0.2403846,
        size.width * 0.5411538,
        size.height * 0.2350000,
        size.width * 0.5438462,
        size.height * 0.2292308,
      )
      ..cubicTo(
        size.width * 0.5461538,
        size.height * 0.2234615,
        size.width * 0.5496154,
        size.height * 0.2188462,
        size.width * 0.5538462,
        size.height * 0.2146154,
      )
      ..cubicTo(
        size.width * 0.5580769,
        size.height * 0.2103846,
        size.width * 0.5630769,
        size.height * 0.2069231,
        size.width * 0.5684615,
        size.height * 0.2046154,
      )
      ..cubicTo(
        size.width * 0.5742308,
        size.height * 0.2019231,
        size.width * 0.5800000,
        size.height * 0.2007692,
        size.width * 0.5861538,
        size.height * 0.2007692,
      )
      ..close();

    final paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffffffff);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
