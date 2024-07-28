import 'package:custom_widgets/src/animation_loading/prograssive_dots.dart';
import 'package:flutter/material.dart';

/// Widget de carga
class LoadingWidget extends StatelessWidget {
  /// Constructor
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PrograssiveDots(
      color: Theme.of(context).colorScheme.primary,
      size: 30,
      key: key,
    );
  }
}
