import 'package:flutter/material.dart';

/// Widget botton version 1
class ButtonV2 extends StatelessWidget {
  /// Constructor
  const ButtonV2({
    required this.text,
    required this.onPressed,
    super.key,
  });

  /// Texto para el boton
  final String text;

  /// Funcion para el evento click del boton
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        // padding: const EdgeInsets.symmetric(vertical: 15),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: onPressed != null
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(0.4),
        ),
      ),
    );
  }
}
