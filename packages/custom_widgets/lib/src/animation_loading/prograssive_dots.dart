import 'package:custom_widgets/src/animation_loading/draw_dot.dart';
import 'package:flutter/material.dart';

/// Widget de efecto loading progressive
class PrograssiveDots extends StatefulWidget {
  ///constructor
  const PrograssiveDots({
    required this.color,
    required this.size,
    super.key,
  });

  /// Tamaño
  final double size;

  /// Color
  final Color color;

  @override
  PrograssiveDotsState createState() => PrograssiveDotsState();
}

/// Estado
class PrograssiveDotsState extends State<PrograssiveDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color;
    final size = widget.size;
    final dotSize = size * 0.17;
    final negativeSpace = size - (4 * dotSize);
    final gapBetweenDots = negativeSpace / 3;
    final previousDotPosition = -(gapBetweenDots + dotSize);

    Widget translatingDot() => Transform.translate(
          offset: Tween<Offset>(
            begin: Offset.zero,
            end: Offset(previousDotPosition, 0),
          )
              .animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(
                    0.22,
                    0.82,
                  ),
                ),
              )
              .value,
          child: DrawDot.circular(
            dotSize: dotSize,
            color: color,
          ),
        );

    // ignore: avoid_positional_boolean_parameters
    Widget scalingDot(bool scaleDown, Interval interval) => Transform.scale(
          scale: Tween<double>(
            begin: scaleDown ? 1.0 : 0.0,
            end: scaleDown ? 0.0 : 1.0,
          )
              .animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: interval,
                ),
              )
              .value,
          child: DrawDot.circular(
            dotSize: dotSize,
            color: color,
          ),
        );

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              scalingDot(
                true,
                const Interval(
                  0,
                  0.4,
                ),
              ),
              translatingDot(),
              translatingDot(),
              Stack(
                children: <Widget>[
                  scalingDot(
                    false,
                    const Interval(
                      0.3,
                      0.7,
                    ),
                  ),
                  translatingDot(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
