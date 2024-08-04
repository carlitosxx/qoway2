import 'package:flutter/material.dart';

/// clase de entrada para el correo
class TextfieldEmail extends StatelessWidget {
  /// Widget de entrada para el correo
  const TextfieldEmail({
    required this.hint,
    required this.controller,
    this.onChanged,
    super.key,
  });

  /// Texto de apoyo visual de lo que debe ingresar
  final String hint;

  /// Controlador para obtener el valor del texto ingresado
  final TextEditingController controller;

  /// Funcion para ingresar logica al detectar un cambio en el textfield
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          onChanged: onChanged,
          controller: controller,
          maxLength: 100,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 50),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Theme.of(context).colorScheme.onSurface.withOpacity(.1),
            filled: true,
            counterText: '',
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 12,
          child: Icon(
            Icons.email_rounded,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
