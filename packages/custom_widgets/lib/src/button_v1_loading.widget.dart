import 'package:custom_widgets/src/animation_loading/prograssive_dots.dart';
import 'package:flutter/material.dart';

/// Widget botton version 1 loading
class ButtonV1Loading extends StatelessWidget {
  /// Constructor
  const ButtonV1Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 7),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: PrograssiveDots(
        color: Theme.of(context).colorScheme.primary,
        size: 36,
        key: key,
      ),
    );
  }
}
